Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B387F134
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 21:35:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g5o8CuNV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz67H6G2nz3c1g
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 07:35:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g5o8CuNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz66k3XnVz3c1g
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 07:35:09 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-512b3b04995so4280276e87.3
        for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 13:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710794101; x=1711398901; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rHEIlIui1GaaTeUNex5nHn8tVlKwAxvuYmUhw/63lM=;
        b=g5o8CuNVIuCcqmcF3qmiWkm0009FbmgnzC93ijf8EZtkG6jf0VTxKCy0eLPG1OGKon
         ex05uGuQklonrTbQ/LJ2Bz2s4RdtqUFvV6hYQLx3238uR1PlNUIJjaslA5ZCiy5ZLyRV
         AtFl78awouluI+yHmgBv2KGbAHEZBkOG3onLnDhTgC0OkHI0B8baqSVJVWGmSrXefmjr
         gCV5MYBqetAxfKbrPectmulUaVB2qIeqeFdXlKnv3BiY7MVOYccm8FQLahau9YWCsQFK
         WNdkTStddYdOl0aGBxwqYEveXLVRO7ANmEqOLpsD0KH1Ocz2n/JgNpSe39YtTfuoi303
         UWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710794101; x=1711398901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rHEIlIui1GaaTeUNex5nHn8tVlKwAxvuYmUhw/63lM=;
        b=UyQD+IAmHBRa65T5Icl5aGGujGUWdfXPjOiOqLeOCzr9y5ItEy/Vea7Kctf8cD9HJj
         1W6w2xG0epSzBYPGVyEkckQdodn/SllPSdgVIxAIGTjnGMNZ0YgJOQScXeUUfjJqN8Rh
         8ED30Lm71QzWmsd5n8TcOIH7S8v0hSEH8nZJdtILVyy3Rlf0S8BzyQMVyp/Hj8gnVBbx
         msqwFZyZWK69P1lfbRckCr08P1ZkwhszOlocoWyA2V8ZuhkvmkjzjDVjFTo2xtIWTVEp
         fatsFRBmXpGWDQrrHMHR95+IIPqLfiiQoH7fgCx/5kYFgrXFhlzEsSLltbYjl5MlsKo9
         RIOA==
X-Gm-Message-State: AOJu0Yyd1l78ZK5CD9eJ8xLznJi4p3st1/2ojAzAe8n6Pf9zbyKJgePd
	Vm6//SOarB76gNFMmM9tSatqh371w6zmLVt6Z7HEGzd8PBBPvfTVNSRMzWDoisM=
X-Google-Smtp-Source: AGHT+IFTvK4xxcJ6ZuMJE0yh3334yQsQCDnmSIgxPo9MarXuCpDnkpTbfwxUpr/se5W7Dz4bpkvgEg==
X-Received: by 2002:ac2:5b0e:0:b0:513:c77e:f44a with SMTP id v14-20020ac25b0e000000b00513c77ef44amr7712751lfn.1.1710794101307;
        Mon, 18 Mar 2024 13:35:01 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id p2-20020a056512328200b00513e12c72adsm919789lfe.76.2024.03.18.13.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:35:01 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 42IKYwEn029081;
	Mon, 18 Mar 2024 23:34:59 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 42IKYwTC029080;
	Mon, 18 Mar 2024 23:34:58 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH downstream-hack dev-6.6 0/6] Virtual Media DVD support
Date: Mon, 18 Mar 2024 23:34:39 +0300
Message-Id: <20240318203445.29036-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Fertser <fercerpav@gmail.com>, Igor Kononenko <i.kononenko@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Microsoft distributes their Windows Server images as ".iso" files suitable for
burning on DVD medium.

This patch series allows to use such images directly via the Virtual Medium
(jsnbd + Linux USB gadget subsystem) OpenBMC feature provided
functions/mass_storage.usb0/lun.0/cdrom is set to 1 by /etc/nbd-proxy/state
hook.

The code was taken from the latest rejected upstream submission [0] and massaged
to apply to the current dev-6.6 branch. Since the patches were written the
upstream gained support for images larger than 2 TB [1], unfortunately applying
this series disables it.

Tested by installing Windows Server via Virtual Media with AST2600-based BMC.

I'm sharing these hoping it might be useful to community, without any particular
plans or desire to integrate and maintain them downstream (though I might post
an updated version in the future if applying becomes non-trivial again).

An alternative to using this series for installing Windows on bare metal is to
educate your customers about a much faster (the files would be downloaded using
host network card and HTTP + CIFS) and easier to automate way provided by iPXE +
wimboot [2], also available as part of netboot.xyz [3].

[0] https://lore.kernel.org/all/20210626211820.107310-1-i.kononenko@yadro.com/
[1] https://lore.kernel.org/r/20210921145901.11952-1-nikita.yoush@cogentembedded.com
[2] https://ipxe.org/howto/winpe
[3] https://netboot.xyz/docs/kb/pxe/windows/

Igor Kononenko (6):
  usb:gadget:mass-storage: Improve the signature of SCSI handler
    function
  usb:gadget:mass-storage: refactoring the SCSI command handling
  fms: Add TOC/PMA/ATIP DVD-ROM capabilities
  fms: Support the DVD/BD images size over 2.1Gb
  FMS: Add the SCSI Get Configuration command.
  FMS: Add SCSI Read Disc Information command.

 drivers/ata/libata-zpodd.c                   |    8 +-
 drivers/usb/gadget/function/f_mass_storage.c | 1007 ++++++++++-----
 drivers/usb/gadget/function/storage_common.c |   17 +-
 drivers/usb/gadget/function/storage_common.h |    5 +
 include/scsi/scsi_proto.h                    |    2 +
 include/uapi/linux/cdrom.h                   | 1208 +++++++++++++++++-
 6 files changed, 1857 insertions(+), 390 deletions(-)


base-commit: f8b04488b060b155f8b6769aa70412c3630b03f0
-- 
2.34.1

