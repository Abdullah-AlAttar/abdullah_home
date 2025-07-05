#!/bin/bash

# Script to calculate optimal Alacritty dimensions for 80% screen coverage
# Usage: ./calculate_alacritty_dimensions.sh

echo "Calculating optimal Alacritty dimensions for 80% screen coverage..."

# Get screen resolution using xrandr (works on Wayland too)
if command -v xrandr &> /dev/null; then
    RESOLUTION=$(xrandr | grep -E "connected primary|connected.*[0-9]+x[0-9]+" | head -1 | grep -o '[0-9]*x[0-9]*')
    if [ -n "$RESOLUTION" ]; then
        WIDTH=$(echo $RESOLUTION | cut -d'x' -f1)
        HEIGHT=$(echo $RESOLUTION | cut -d'x' -f2)
        echo "Screen resolution: ${WIDTH}x${HEIGHT}"
        
        # Calculate 80% of screen
        TARGET_WIDTH=$((WIDTH * 80 / 100))
        TARGET_HEIGHT=$((HEIGHT * 80 / 100))
        
        echo "Target window size (80%): ${TARGET_WIDTH}x${TARGET_HEIGHT}"
        
        # Estimate character dimensions (assuming font size 12)
        # Average character width: ~7-8 pixels, height: ~15-16 pixels
        CHAR_WIDTH=7
        CHAR_HEIGHT=15
        
        COLUMNS=$((TARGET_WIDTH / CHAR_WIDTH))
        LINES=$((TARGET_HEIGHT / CHAR_HEIGHT))
        
        echo "Suggested Alacritty dimensions:"
        echo "columns = $COLUMNS"
        echo "lines = $LINES"
        echo ""
        echo "Add this to your alacritty.toml:"
        echo "dimensions = { columns = $COLUMNS, lines = $LINES }"
    else
        echo "Could not detect screen resolution"
    fi
else
    echo "xrandr not available. Please install it or check your display manually."
fi

# Alternative method using environment variables (Wayland)
if [ -n "$WAYLAND_DISPLAY" ]; then
    echo ""
    echo "Running on Wayland. You can also try using wlr-randr if available:"
    if command -v wlr-randr &> /dev/null; then
        wlr-randr | grep -E "^[A-Z].*[0-9]+x[0-9]+"
    fi
fi
