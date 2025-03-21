# Build Stage
FROM swift:latest AS build
WORKDIR /app
COPY . .
RUN swift build -c release

# Runtime Stage
FROM swift:latest AS runtime
WORKDIR /app
# Copy the compiled binary from the build stage
COPY --from=build /app/.build/release /app
CMD ["/app/SwiftServer"]

