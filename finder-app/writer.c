#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog(NULL, 0, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Error: Two arguments required: <file> <text>");
        closelog();
        return 1;
    }

    const char *file_path = argv[1];
    const char *text = argv[2];
    FILE *fp = fopen(file_path, "w");

    if (!fp) {
        syslog(LOG_ERR, "Error opening file: %s", file_path);
        closelog();
        return 1;
    }

    fprintf(fp, "%s", text);
    syslog(LOG_DEBUG, "Writing %s to %s", text, file_path);
    fclose(fp);
    closelog();
    return 0;
}
