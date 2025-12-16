# Song View

A beautiful, modern web-based viewer for Spotify playlist exports. Designed to work with CSV files exported from tools like [Exportify](https://exportify.app/).

## Features

- **Beautiful Visualizer**: View your music library in a sleek, modern interface.
- **Data Analysis**: See stats about your library including total tracks, artists, albums, and duration.
- **Search & Sort**: Quickly find tracks and sort by popularity, duration, added date, and more.
- **Table & Grid Views**: Switch between a detailed table view and a visual grid view.
- **Audio Previews**: Play 30-second previews of tracks (where available) with a visual progress indicator.
- **Infinite Scroll**: Smoothly browse large libraries without pagination.
- **Theme Support**: Customize the look and feel with built-in themes.
- **Zero Upload**: Your data stays local. The CSV is parsed directly in your browser.

## Usage

1.  Export your Spotify playlist to CSV using a tool like [Exportify](https://exportify.app/).
2.  Open `index.html` in your web browser (or host it locally).
3.  Drag and drop your CSV file onto the page.
4.  Explore your music!

## Development

This project uses vanilla HTML, CSS, and JavaScript. No build step is required.

### Project Structure

- `index.html`: Main entry point.
- `app.js`: Application bootstrapper.
- `js/`: Application logic (modular ES6).
- `css/`: Stylesheets (variables, layout, components, themes).


## Deployment (Cloudflare Pages + D1)

This project supports sharing playlist functionality using Cloudflare Pages Functions and D1 (Serverless SQL Database).

### Prerequisites

- Cloudflare Account
- Node.js installed locally
- Wrangler CLI (`npm install -g wrangler`)

### Setup Instructions

1.  **Login to Cloudflare**:
    ```bash
    npx wrangler login
    ```

2.  **Create D1 Database**:
    ```bash
    npx wrangler d1 create song-view-db
    ```
    *Copy the `database_id` from the output.*

3.  **Update Configuration**:
    Edit `wrangler.toml` and replace `choose-your-database-id-during-setup` with your actual database ID.

    ```toml
    [[d1_databases]]
    binding = "DB"
    database_name = "song-view-db"
    database_id = "your-actual-db-id"
    ```

4.  **Apply Schema**:
    Initialize the database table.
    ```bash
    npx wrangler d1 execute song-view-db --local --file=./migrations/0000_initial.sql
    # For production:
    npx wrangler d1 execute song-view-db --remote --file=./migrations/0000_initial.sql
    ```

5.  **Run Locally (with backend)**:
    ```bash
    npx wrangler pages dev .
    ```

6.  **Deploy**:
    ```bash
    npx wrangler pages deploy .
    ```

