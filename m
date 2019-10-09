Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A0D086E
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 09:38:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p5g92qBNzDqPc
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 18:38:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YNBVIdzz"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p5fP1yM9zDqLq
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 18:37:47 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id u8so2856852iom.5
 for <openbmc@lists.ozlabs.org>; Wed, 09 Oct 2019 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IRuIeF+goexMmD+UZSdra03QKAJ5Xqsi12mIS8ZMJVE=;
 b=YNBVIdzzyVcFoGG/REcFPdGEQPrMLE3fmTgOe/NyASKlGrzzgUUe6R2NtgboNQze+7
 9TUGUtbBweLMU8qeJjKg5w+wmXLz4j8vmKsIUnWEgsOiK+iICXs4U+A+OtSPzCWeFfKx
 4WE3OdaHYgjjj7J0bKSjy39pSOycEN85D0Etz4krTsS5OZo9hXfesy1JzD5xJzSqLesG
 bvKYjiCQQFxiZ/dHTKIEbOFLYW6vbnLrDysQuCbdx7xoaa8A1dk5xHcL21FlMkPblo5X
 5v0EHV9cRR2MTxHQFiguIkXIajQvMVmuvqVEYt/x/UnooRQSqkvMLnO2mCHvhqPfbPFF
 HpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRuIeF+goexMmD+UZSdra03QKAJ5Xqsi12mIS8ZMJVE=;
 b=PGwtLBpuk6h5Z5r6bWoQaAPHms//9xbDg/eeg81b/wTTPxq7pfJkf8BwBudo3AmPfZ
 n3tR1FVbWjnu2tg8S5Fh2atPoZ+mqUC01FO/sEqTYWWFUompDWh4KCjQdKpy6S5JOMxK
 kykL9qVtem0e5ugbqPUh6dq/a3XFOFiiWnquVFd/G8tmxNKoErB/xhZgyQeH182nG59o
 8E9eSYjnINTzRO013tOUFzlZDo5ftBQjEV6fuj8XskMti5++ziM3/45z96G49WOLX6TW
 tk5Ce9dbgv43oTXtma9kPpZpU0CT+KHNFM133xKKt3rbLFnMxqU0nc0d68nGgBsBMuTH
 Tikw==
X-Gm-Message-State: APjAAAWUG1OhiuV76lehdr3M5nxDhc+w4tzHAlbdepUFYIh/WVJC+VnV
 FjXS8OLCqsH8obrhvctd6TTXuw+LLLJyuE5Avig=
X-Google-Smtp-Source: APXvYqxl9w8DKgtXxctJ8m8D8lzPvzEmdgTvvppqLEQI9q9CVhwe5jUqCFU9FiK9vQdeb1+50dE706a9eA8TKP71A5E=
X-Received: by 2002:a92:a103:: with SMTP id v3mr1976132ili.52.1570606663651;
 Wed, 09 Oct 2019 00:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <04OHMEtrxc_iJdSbU6rDJXL_UCRii-RCTkBIgd3MYtzMqT-foopH3hioArbdi8gI4E1aQmmpui8dpvT8SdspVITAnycKL498kmbuSiK4dpc=@protonmail.com>
In-Reply-To: <04OHMEtrxc_iJdSbU6rDJXL_UCRii-RCTkBIgd3MYtzMqT-foopH3hioArbdi8gI4E1aQmmpui8dpvT8SdspVITAnycKL498kmbuSiK4dpc=@protonmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 9 Oct 2019 15:37:32 +0800
Message-ID: <CAARXrtkqKhQ-4ww+7s-1tZ58gQXVwcwe66oMK_qbDNRjMyuBzA@mail.gmail.com>
Subject: Re: Image verfication failure doesn't prevent BMC update
To: rgrs <rgrs@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It is most likely the field mode is not enabled.
See the related code at
https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/85c356f76fe07db3c1253c48f5b35c5811a15c07/activation.cpp#L180

On Wed, Oct 9, 2019 at 3:32 PM rgrs <rgrs@protonmail.com> wrote:
>
> Hi All,
>
> I am trying to sign my image with OEM keys instead of default OpenBMC.priv which is part of the repo.
> When I tried to update OEM signed BMC, phosphor-image-updater logs messages related to "Signature validation failed"
> But the flashing continued and activation was successful.
>
> I expected flash procedure to fail since, default private key (OpenBMC.priv,RSA-1024,SHA256) is different from OEM private key (RSA-2048,SHA256)
>
> Log:
>
> Sep 17 09:44:50 lhost phosphor-version-software-manager[1350]: Untaring
> Sep 17 09:44:50 lhost phosphor-mapper[1135]: Found invalid association on path /xyz/openbmc_project/software/11daa823
> Sep 17 09:44:50 lhost phosphor-mapper[1135]: Found invalid association on path /xyz/openbmc_project/software/11daa823
> Sep 17 09:44:51 lhost phosphor-image-updater[1316]: BMC image activating - BMC reboots are disabled.
> Sep 17 09:44:51 lhost phosphor-image-updater[1316]: EVP_DigestVerifyFinal:Signature validation failed
> Sep 17 09:44:51 lhost phosphor-image-updater[1316]: System level Signature Validation failed
> Sep 17 09:44:51 lhost phosphor-image-updater[1316]: Error occurred during image validation
> Sep 17 09:44:51 lhost phosphor-image-updater[1316]: The operation failed internally.
> Sep 17 09:44:51 lhost phosphor-log-manager[1114]: Failed to find metadata
> Sep 17 09:44:51 lhost systemd[1]: Starting Enable a guard that blocks BMC reboot...
> Sep 17 09:44:51 lhost systemd[1]: Starting Updates the u-boot variable to point BMC version to 25904a91...
> Sep 17 09:44:51 lhost systemd[1]: Starting Set U-Boot environment variable...
> Sep 17 09:44:51 lhost systemd[1]: Created slice system-obmc\x2dflash\x2dbmc\x2dubiro\x2dremove.slice.
> Sep 17 09:44:52 lhost systemd[1]: Starting Deletes read-only and kernel ubi volume d4a39257...
> Sep 17 09:44:52 lhost systemd[1]: reboot-guard-enable.service: Succeeded.
> Sep 17 09:44:52 lhost systemd[1]: Started Enable a guard that blocks BMC reboot.
> Sep 17 09:44:54 lhost kernel: block ubiblock0_0: released
> Sep 17 09:44:54 lhost systemd[1]: media-rofs\x2dd4a39257.mount: Succeeded.
> Sep 17 09:44:55 lhost systemd[1]: obmc-flash-bmc-setenv@d4a39257.service: Succeeded.
> Sep 17 09:44:55 lhost systemd[1]: Started Set U-Boot environment variable.
> Sep 17 09:44:55 lhost systemd[1]: Created slice system-obmc\x2dflash\x2dbmc\x2dubiro.slice.
> Sep 17 09:44:55 lhost systemd[1]: Starting Store read-only images 11daa823 to BMC storage...
> Sep 17 09:44:55 lhost systemd[1]: Starting Create BMC read-write ubi volume...
> Sep 17 09:44:57 lhost systemd[1]: Starting Hostname Service...
> Sep 17 09:44:58 lhost systemd[1610]: systemd-hostnamed.service: PrivateNetwork=yes is configured, but the kernel does not support network namespaces, ignoring.
> Sep 17 09:44:58 lhost systemd[1]: obmc-flash-bmc-ubirw.service: Succeeded.
> Sep 17 09:44:58 lhost systemd[1]: Started Create BMC read-write ubi volume.
> Sep 17 09:44:59 lhost systemd[1]: Started Hostname Service.
> Sep 17 09:45:00 lhost phosphor-dump-manager[1136]: Tue Sep 17 09:45:00 UTC 2019 Report is available in /var/lib/phosphor-debug-collector/dumps/3
> Sep 17 09:45:01 lhost systemd[1]: obmc-flash-bmc-ubiro-remove@d4a39257.service: Succeeded.
> Sep 17 09:45:01 lhost systemd[1]: Started Deletes read-only and kernel ubi volume d4a39257.
> Sep 17 09:45:01 lhost phosphor-dump-manager[1136]: Tue Sep 17 09:45:01 UTC 2019 Successfully completed
> Sep 17 09:45:18 lhost systemd[1]: obmc-flash-bmc-updateubootvars@25904a91.service: Succeeded.
> Sep 17 09:45:18 lhost systemd[1]: Started Updates the u-boot variable to point BMC version to 25904a91.
> Sep 17 09:45:29 lhost systemd[1]: systemd-hostnamed.service: Succeeded.
> Sep 17 09:46:28 lhost obmc-flash-bmc[1659]: Volume ID 0, size 287 LEBs (18772096 bytes, 17.9 MiB), LEB size 65408 bytes (63.8 KiB), static, name "rofs-11daa823", alignment 1
> Sep 17 09:47:12 lhost kernel: block ubiblock0_0: created from ubi0:0(rofs-11daa823)
> Sep 17 09:47:24 lhost obmc-flash-bmc[1702]: Volume ID 1, size 37 LEBs (2420096 bytes, 2.3 MiB), LEB size 65408 bytes (63.8 KiB), static, name "kernel-11daa823", alignment 1
> Sep 17 09:47:32 lhost obmc-flash-bmc[1702]: Volume ID 2, size 37 LEBs (2420096 bytes, 2.3 MiB), LEB size 65408 bytes (63.8 KiB), static, name "kernel-11daa823", alignment 1
> Sep 17 09:47:40 lhost obmc-flash-bmc[1769]: [130B blob data]
> Sep 17 09:47:41 lhost obmc-flash-bmc[1769]: [1.9K blob data]
> Sep 17 09:47:41 lhost obmc-flash-bmc[1769]: [2.1K blob data]
> Sep 17 09:47:41 lhost systemd[1]: obmc-flash-bmc-ubiro@11daa823.service: Succeeded.
> Sep 17 09:47:41 lhost systemd[1]: Started Store read-only images 11daa823 to BMC storage.
> Sep 17 09:47:41 lhost systemd[1]: Starting Updates the u-boot variable to point BMC version to 11daa823...
> Sep 17 09:47:41 lhost systemd[1]: Starting Set U-Boot environment variable...
> Sep 17 09:47:43 lhost systemd[1]: obmc-flash-bmc-setenv@11daa823\x3d0.service: Succeeded.
> Sep 17 09:47:43 lhost systemd[1]: Started Set U-Boot environment variable.
> Sep 17 09:47:45 lhost systemd[1]: obmc-flash-bmc-updateubootvars@11daa823.service: Succeeded.
> Sep 17 09:47:45 lhost systemd[1]: Started Updates the u-boot variable to point BMC version to 11daa823.
> Sep 17 09:47:45 lhost phosphor-image-updater[1316]: BMC activation has ended - BMC reboots are re-enabled.
> Sep 17 09:47:45 lhost systemd[1]: Starting Removes the guard that blocks BMC reboot...
> Sep 17 09:47:45 lhost systemd[1]: reboot-guard-disable.service: Succeeded.
> Sep 17 09:47:45 lhost systemd[1]: Started Removes the guard that blocks BMC reboot.
> Thanks,
> Raj
