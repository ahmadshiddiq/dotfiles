const fs = require("fs");

// example input.csv
// "User","Email","Client","Project","Description","Description","Billable","Start date","Start time","End date","End time","Duration","Tags"
// "Ahmad Shiddiq","ahmadshiddiqamin@gmail.com","","","","x-topic-selection","No","2024-11-25","12:26:10","2024-11-25","12:51:29","0.42","coding"

// Function to round up to the nearest quarter-hour
function roundToNearestQuarterHour(duration) {
  return Math.ceil(duration * 4) / 4;
}

function parseCsvAndSumDurationsWithDescriptions(
  filePath,
  dateColumn,
  durationColumn,
  descriptionColumn,
  tagsColumn
) {
  if (!fs.existsSync(filePath)) {
    console.error(`File not found: ${filePath}`);
    return;
  }

  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      console.error(`Error reading the file: ${err.message}`);
      return;
    }

    const rows = data
      .split("\n")
      .map((row) => row.trim())
      .filter(Boolean);
    if (rows.length < 2) {
      console.error("The CSV file appears to be empty or missing data.");
      return;
    }

    const headers = rows[0]
      .split(",")
      .map((header) => header.replace(/(^"|"$)/g, "").trim());

    // Map columns to their indices
    const dateIndex = headers.indexOf(dateColumn);
    const durationIndex = headers.indexOf(durationColumn);
    const descriptionIndex = headers.indexOf(descriptionColumn);
    const tagsIndex = headers.indexOf(tagsColumn);

    if (
      dateIndex === -1 ||
      durationIndex === -1 ||
      descriptionIndex === -1 ||
      tagsIndex === -1
    ) {
      console.error("Some required columns are not found in the file.");
      return;
    }

    // Group durations and descriptions by date
    const groupedData = rows.slice(1).reduce((acc, row) => {
      const columns = row
        .split(",")
        .map((col) => col.replace(/(^"|"$)/g, "").trim());
      const date = columns[dateIndex];
      const duration = parseFloat(columns[durationIndex]) || 0;
      const description = columns[descriptionIndex] || "Unknown Description";
      const tags = columns[tagsIndex] || "Unknown Tags";

      if (date) {
        if (!acc[date]) {
          acc[date] = {
            totalDuration: 0,
            descriptions: new Set(),
            tags: new Set(),
          };
        }
        acc[date].totalDuration += duration;
        acc[date].descriptions.add(description);
        acc[date].tags.add(tags);
      }

      return acc;
    }, {});

    // Display grouped results with rounding and description details
    console.log(
      "Summed Durations by Date with Descriptions (Rounded to Nearest Quarter):"
    );
    for (const [date, { totalDuration, descriptions, tags }] of Object.entries(
      groupedData
    )) {
      const roundedDuration = roundToNearestQuarterHour(totalDuration);
      const descriptionList =
        Array.from(descriptions).join(", ") || "Unknown Description";
      const tagsList = Array.from(tags).join(", ") || "Unknown Tags";
      console.log(
        `Date: ${date}, Total Duration: ${roundedDuration.toFixed(
          2
        )} hours (${descriptionList}) [${tagsList}]`
      );
    }
  });
}

// Path to the CSV file and desired columns
const csvFilePath = process.argv[2];
const dateColumn = "Start date";
const durationColumn = "Duration";
const descriptionColumn = "Description";
const tagsColumn = "Tags";

// Run the parser
if (csvFilePath) {
  parseCsvAndSumDurationsWithDescriptions(
    csvFilePath,
    dateColumn,
    durationColumn,
    descriptionColumn,
    tagsColumn
  );
} else {
  console.error("Please provide the path to the CSV file as an argument.");
}
