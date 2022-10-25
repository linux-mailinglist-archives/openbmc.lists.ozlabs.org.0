Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA87F60D967
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 04:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxtV352Lfz3byj
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 13:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BAg0jygE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=adhemerval.zanella@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BAg0jygE;
	dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxl6N60hCz2xWx
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 08:13:31 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id cy15-20020a056830698f00b0065c530585afso8661019otb.2
        for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 14:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=drG7vZ5MgfaxQlCjXwZfzFhkOaVkaVtZS0brwwOhjJM=;
        b=BAg0jygEqO7p8RW04l9ybtBxmZs2IdyjPs0gGUUe1cUCzSwocO+HyDXACfhbJEeaPJ
         O6Ot2xbY6PkztXEPPdnevwJMNqbZ0sJlG92B8tQ/LvL1LJjOYCWMGUOEr4kktBpjXPb4
         VsKd93G3Ijzg6RZkj9Qnaqzo7wXmcXoI61h3eLh6LwZZ40qidsF4kQSRs2ZFu5c7TsZ4
         cYOspCdu26t+5zmJ2kNxRCBuCcqtreuxU/9doeo1p1K/LOPMips+L4wAcetyOhtxVCn3
         /Qku4VTtNc+UflzGfSYDsVPhB+566HJj/krv73X8ZMh7JvZbcbbGkgzwMZ41zy+NxZtw
         mbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drG7vZ5MgfaxQlCjXwZfzFhkOaVkaVtZS0brwwOhjJM=;
        b=YbkYZ/EBTTHoKE/lLz9UBq8d2uy5TjuNx06kbsNX0IywmDdzXtT9c9ZBsFrVSAEQ17
         d9PaHUU0PuIhnkzgCONwEynltiCEb1hmo4VvvazeEI7zEzb5qY6ldoWoVTN4VYnxrSJU
         CY2TIESrHX7OiCCo+38S9Ud5abz2qy3sFDibFvoDpN4ooo5l8tXo9nbNuH/LZH/BGuQ+
         ZWUJyXO4D9zIaIouRyrHRy25JGjZmIixylze7QeB8MAsF0pK0nGp+7BcxLoCsKbFVcT2
         /bG76Ln3jjlXqd/vImPRFEHBl4GIQuTvVOCAJMUcWqyGlxcTZIbqRvOPJ75p48aqMSsM
         3bbA==
X-Gm-Message-State: ACrzQf3GfWkiOrsEB80REp8gk7BLtoYuKuQOCA9dW1na0ErghvlpPFST
	VpsbrvAyU05jFpYucZ5KkB9E/A==
X-Google-Smtp-Source: AMsMyM4+OQGupMEakieeTstiyu9Vs0ymL1BYQiNMdX5URm5nZo0JzMN7UQZ+Z8mGXmAiZng4wKJYUg==
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id h22-20020a9d61d6000000b00661c1ad848fmr20418875otk.111.1666732405949;
        Tue, 25 Oct 2022 14:13:25 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c0:17c8:3978:9d2:1936:95b? ([2804:1b3:a7c0:17c8:3978:9d2:1936:95b])
        by smtp.gmail.com with ESMTPSA id ck4-20020a056830648400b00661c0747545sm1500004otb.44.2022.10.25.14.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 14:13:25 -0700 (PDT)
Message-ID: <72f37987-5f8a-99c5-bd36-5153343dcf75@linaro.org>
Date: Tue, 25 Oct 2022 18:13:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: nscd time_t size mismatch problem
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, libc-alpha@sourceware.org
References: <Y1g/C4pinQ1tutC4@hatter.bewilderbeest.net>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <Y1g/C4pinQ1tutC4@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Oct 2022 13:43:43 +1100
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
Cc: openbmc@lists.ozlabs.org, Wayne Tung <wayne.tung@ui.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 25/10/22 16:54, Zev Weiss via Libc-alpha wrote:
> Hello glibc devs,
> 
> We've recently been seeing some misbehavior from nscd in OpenBMC.  It
> manifests as lots of log messages like:
> 
>     disabled inotify-based monitoring for file /passwd': No such file or directory
>     stat failed for file /passwd'; will try again later: No such file or directory
>     disabled inotify-based monitoring for file /group': No such file or directory
>     stat failed for file /group'; will try again later: No such file or directory
>     disabled inotify-based monitoring for file /hosts': No such file or directory
>     stat failed for file /hosts'; will try again later: No such file or directory
>     disabled inotify-based monitoring for file /resolv.conf': No such file or directory
>     stat failed for file /resolv.conf'; will try again later: No such file or directory
> 
> and so forth.  I initially assumed it was a configure-time --sysconfdir mixup, but after digging into it I found that it actually stems from a time_t size mismatch (this is a 32-bit ARM gnueabi target):
> 
>     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' time/time.o
>     type = long
>     $1 = 4
>     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' nscd/nscd.o
>     type = long long
>     $1 = 8
> 
> The confusing log messages are thus just the result of the coincidence that sizeof(long long) - sizeof(long) == strlen("/etc"), which causes the disagreement in the layout of struct traced_file to make it look like the 'fname' member just had its directory prefix chopped off.
> 
> In the discussion of the bug in the OpenBMC issue tracker [0], Wayne Tung (CCed) came up with the patch below, which does seem to solve the immediate problem, but if I'm understanding things right does so by just reverting nscd to a 32-bit time_t, and so I'd expect probably wouldn't be considered the "right" fix -- however I don't presently know enough about the 32/64-bit time_t transition and ensuing compatibility concerns to know what the right fix really is.  Should nscd perhaps be using __time64_t or something instead of time_t?

Reverting to 32 bits time_t only means that we are postponing some potential
failure to y2038, we really move everything to 64 bit time_t.  Could you check
if the following patch fix it?

The issue is we do build nss modules with 64 time_t, however some features
are built on libc.so itself and in such cases we need to explicit use the
internal __time64_t type.

diff --git a/nscd/nscd.h b/nscd/nscd.h
index 368091aef8..f15321585b 100644
--- a/nscd/nscd.h
+++ b/nscd/nscd.h
@@ -65,7 +65,7 @@ typedef enum
 struct traced_file
 {
   /* Tracks the last modified time of the traced file.  */
-  time_t mtime;
+  __time64_t mtime;
   /* Support multiple registered files per database.  */
   struct traced_file *next;
   int call_res_init;

> 
> 
> Thanks,
> Zev Weiss
> 
> [0] https://github.com/openbmc/openbmc/issues/3881
> 
> From 0fda9faf757abd4f5469e6d9207499e97f79a663 Mon Sep 17 00:00:00 2001
> From: Wayne Tung <wayne.tung@ui.com>
> Date: Thu, 13 Oct 2022 13:10:21 +0800
> Subject: [PATCH] Use 32 bits time_t for ncsd
> 
> ---
>  Makeconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makeconfig b/Makeconfig
> index 47db08d6ae..f78f7cc74a 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -869,7 +869,7 @@ endif
>  +extra-math-flags = $(if $(filter libm,$(in-module)),-fno-math-errno,-fmath-errno)
> 
>  # Use 64 bit time_t support for installed programs
> -installed-modules = nonlib nscd lddlibc4 ldconfig locale_programs \
> +installed-modules = nonlib lddlibc4 ldconfig locale_programs \
>             iconvprogs libnss_files libnss_compat libnss_db libnss_hesiod \
>             libutil libpcprofile libSegFault
>  +extra-time-flags = $(if $(filter $(installed-modules),\
> -- 
> 
