#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    openlog(NULL,0,LOG_USER);

    if (argc < 3) {
        syslog(LOG_ERR, "writer: requires writefile and writestr arguments");
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", writestr, writefile);

    FILE *f = fopen(writefile, "w");

    if (f == NULL) {
        perror("writer: could not create file");
    } else {
        fprintf(f, "%s\n", writestr);
    }


    fclose(f);

    syslog(LOG_DEBUG, "hi");

    closelog();
}


