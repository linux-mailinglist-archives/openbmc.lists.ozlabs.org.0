Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D42465A69
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 01:06:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4GT94mJgz3bN8
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 11:06:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JKTp2Ww0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=JKTp2Ww0; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3sgz46Zpz2yfn
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 19:29:18 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id r25so32881752edq.7
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GAZPYRVnvBCeiKcXDK+/q3f5u0oQKdRXdD24cIuHcvE=;
 b=JKTp2Ww05F6bsm4jOVZ3fAKwiHd2CBLA5vW72UtfH7/nSJhJho3dX8TsyEu02hJXdm
 ogL6wOawe+pF6WzsFUQz5GsePtzVdIurjRhXgPRtCDTgruRUggRpjDFKCiOABLwyStvN
 v9YO0PH32sHAHOQ30fKlMAC0VQL6oJVzC41/LYzGSluVqxxHEAgHumwPo6rXEHZn5D80
 42SWeN1H2ulfKKfT+F4uebQjnTyAkWaD/AvvShpgHV/t8BGdg2E8Ja97CM1340doeprp
 HgKikaGhiEOjyZfDSCLc8KITz1fTDxxXNovkDe7z342+sIewJi7Ozd5gUqjNdQWw0DcP
 niFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GAZPYRVnvBCeiKcXDK+/q3f5u0oQKdRXdD24cIuHcvE=;
 b=E7kFhOQd+UBHPFVod+JHLeSGT4UwZct51m8+AWyKLSoKPpKTeo6T6e6egvNiL99CAh
 wVzusQ27lcl/lRKruQ0Ce4lMYRK4gdwkL4O+LavjURvruhfLnxykB11YY4GUn0tI578n
 z8FzjFQpZMiXQd186DTkFM5seZVsjWwj6QbJPAno0mj00jwq1EO5T8gDshoUkOmIEHdC
 ynJrjbbjGEh2jabc2/4P/8Nvve9pR/VKXrm6EiXxxK++kzhOHfAxGgaKowGaiX7UKZZq
 9pBTPMqUiY8P81l/bxAVM3S+lpV3TtaaJzXnyll0EjXkkeSeya4WR6AS349jT0mWeepN
 KiRQ==
X-Gm-Message-State: AOAM531Tgpr6JRj56a2e6ptAacjKrhmH1DA1Tqu+PjjMWq1Sjwe7sh8d
 ZJEaftfHiJCDFb6fHckJhBrW7uYIRbdAo787/kjhsA==
X-Google-Smtp-Source: ABdhPJxD/nL3qj8GquoGY2T+A5+XkGYn6aEV1laTGeZavd1O8RHTg27u832Yw1qwgUv1P+aKrksO8Ez15FlQQHX7nJc=
X-Received: by 2002:a05:6402:27c7:: with SMTP id
 c7mr6727312ede.0.1638347351525; 
 Wed, 01 Dec 2021 00:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au>
In-Reply-To: <20211201072902.127542-1-joel@jms.id.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Dec 2021 09:29:00 +0100
Message-ID: <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 02 Dec 2021 11:06:02 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Systems provide line names to make using GPIOs easier for userspace. Use
> this feature to make the tools user friendly by adding the ability to
> show the state of a named line.
>
>  $ gpioget --line-name power-chassis-good
>  1
>
>  $ gpioget -L pcieslot-power
>  0
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> While users do have the ability to chain together gpioinfo and gpioget,
> this is less discoverable for people new to the tools, and harder to
> explain to eg. technicians, and requires more typing.
>
> Please consider this enhancement. If you are happy with it I can send
> a patch for gpioset too.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tools/gpioget.c | 86 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 64 insertions(+), 22 deletions(-)
>
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 51cecb6a18a9..cd27320b7f2b 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -6,6 +6,7 @@
>  #include <limits.h>
>  #include <stdio.h>
>  #include <string.h>
> +#include <errno.h>
>
>  #include "tools-common.h"
>
> @@ -18,7 +19,7 @@ static const struct option longopts[] = {
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts = "+hvlnB:";
> +static const char *const shortopts = "+hvlnB:L:";
>
>  static void print_help(void)
>  {
> @@ -34,6 +35,7 @@ static void print_help(void)
>         printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
>         printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
>         printf("                set the line bias\n");
> +       printf("  -L, --line-name:\tUse this GPIO line (instead of chip name and offset)\n");
>         printf("\n");
>         print_bias_help();
>  }
> @@ -47,6 +49,7 @@ int main(int argc, char **argv)
>         struct gpiod_line_bulk *lines;
>         struct gpiod_chip *chip;
>         char *device, *end;
> +       char *name = NULL;
>
>         for (;;) {
>                 optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> @@ -69,8 +72,13 @@ int main(int argc, char **argv)
>                 case 'B':
>                         flags |= bias_flags(optarg);
>                         break;
> +               case 'L':
> +                       name = optarg;
> +                       num_lines = 1;
> +                       break;
>                 case '?':
>                         die("try %s --help", get_progname());
> +                       break;
>                 default:
>                         abort();
>                 }
> @@ -79,30 +87,64 @@ int main(int argc, char **argv)
>         argc -= optind;
>         argv += optind;
>
> -       if (argc < 1)
> -               die("gpiochip must be specified");
> -
> -       if (argc < 2)
> -               die("at least one GPIO line offset must be specified");
> -
> -       device = argv[0];
> -       num_lines = argc - 1;
> -
> -       values = malloc(sizeof(*values) * num_lines);
> -       offsets = malloc(sizeof(*offsets) * num_lines);
> -       if (!values || !offsets)
> -               die("out of memory");
> +       if (name) {
> +               struct dirent **entries;
> +               unsigned int num_chips;
> +               int offset, n;
> +
> +               n = scandir("/dev/", &entries, chip_dir_filter, alphasort);
> +               if (n < 0)
> +                       die_perror("unable to scan /dev");
> +               num_chips = n;
> +
> +               values = malloc(sizeof(*values) * 1);
> +               offsets = malloc(sizeof(*offsets) * 1);
> +               if (!values || !offsets)
> +                       die("out of memory");
> +
> +               for (i = 0; i < num_chips; i++) {
> +                       device = entries[i]->d_name;
> +                       chip = chip_open_by_name(device);
> +                       if (!chip) {
> +                               if (errno == EACCES)
> +                                       continue;
> +
> +                               die_perror("unable to open %s", device);
> +                       }
> +                       offset = gpiod_chip_find_line(chip, name);
> +                       if (offset >= 0) {
> +                               offsets[0] = offset;
> +                               break;
> +                       }
> +               }
> +               if (i == num_chips)
> +                       die("unable to find line '%s'", name);
> +       } else {
> +               if (argc < 1)
> +                       die("gpiochip must be specified");
> +
> +               if (argc < 2)
> +                       die("at least one GPIO line offset must be specified");
> +
> +               device = argv[0];
> +               num_lines = argc - 1;
> +
> +               values = malloc(sizeof(*values) * num_lines);
> +               offsets = malloc(sizeof(*offsets) * num_lines);
> +               if (!values || !offsets)
> +                       die("out of memory");
> +
> +               for (i = 0; i < num_lines; i++) {
> +                       offsets[i] = strtoul(argv[i + 1], &end, 10);
> +                       if (*end != '\0' || offsets[i] > INT_MAX)
> +                               die("invalid GPIO offset: %s", argv[i + 1]);
> +               }
>
> -       for (i = 0; i < num_lines; i++) {
> -               offsets[i] = strtoul(argv[i + 1], &end, 10);
> -               if (*end != '\0' || offsets[i] > INT_MAX)
> -                       die("invalid GPIO offset: %s", argv[i + 1]);
> +               chip = chip_open_lookup(device);
> +               if (!chip)
> +                       die_perror("unable to open %s", device);
>         }
>
> -       chip = chip_open_lookup(device);
> -       if (!chip)
> -               die_perror("unable to open %s", device);
> -
>         lines = gpiod_chip_get_lines(chip, offsets, num_lines);
>         if (!lines)
>                 die_perror("unable to retrieve GPIO lines from chip");
> --
> 2.33.0
>

I'm not very convinced to be honest. It's not like "gpioget gpiochip0
`gpiofind gpiochip0 line-name`" requires much more typing than
"gpioget gpiochip --line-name=name". There are also other questions:
this uses getopt and only allows to specify a single line name. What
if we want to specify more lines like with offsets? Even if you allow
multiple names, getopt() doesn't guarantee ordering of arguments.

Bart
