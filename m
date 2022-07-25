Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382157FFB4
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 15:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls0zG1nBRz3bgC
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 23:20:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L1u1LLUJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L1u1LLUJ;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls0yq2mKGz305M
	for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 23:20:17 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id d17so15907232lfa.12
        for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=3HE3Z+wYW9J/mTO1RKqA6GADmJwZy8TVvv3KgQsZUd8=;
        b=L1u1LLUJ5GsN3kdqViGsiofAdi5lnMqoaPyvmZTXRzTu6hkD7HqJ3yEAY25iiV3jiG
         owY9APJGS6x/dGl8yD3k++Xf+BJwt0Q85EVN1tVKyE8HQVHU3tR0j4lIdxNcmkB9Spz+
         Lf+fRqCKvrR7AhCK/cj6qBf3swok7sn5rxgN0hBOvyznGLHQhsahUJJTUG1r9T0lhro8
         z60ypBS1mUX9wLuo+8UFv5XFUtyy0OxM5/b32zCuw1ODgjHq+HVbsv0XPuy0Et6H2H90
         Wtn5vHWMc6kyB+sCwEmyhEgEutRedcbgZ5eMkKkT50m03qE2f25X2buO1dbHrbbMxtBD
         sSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=3HE3Z+wYW9J/mTO1RKqA6GADmJwZy8TVvv3KgQsZUd8=;
        b=RwNqUfGthR2Kw9p/cuD1WSgXvBf41Uvk3qxIM8iTYOhBzb0Ffek+hkvxQzKXbgcOjb
         4LQl2c4BndJXKMgZInjgv6X34ZuDGHqC/FSY5lcuA2S/Wzaiyd3K5yeFWcF8elNRzy3X
         vSdO/bwh8GJ4uaN8cV6jjtDvOW+6rwG1XoAXuOJioWEeamCR8FhGS5aZeEJwqWv+n20A
         9/IFuE8XBtIczBxus4mTY4xGTevTos4KIAtXxW2Lu4+s7GHtOCWoe6YGUuJ8fNBSOEx6
         0aaLuOPIc3iaLEYJdpI2QYiL281g3Jqemnyc1WUzx4eao4uQKZYAxHADzvPq+hr8J69n
         odlA==
X-Gm-Message-State: AJIora/upcnNRTR+D2LBQWm+J7tkYQDbgyN0atmWj0sI3baYfOXTz0Xb
	GsP+VfQYOlvppFGAnuoty5rZKQlAhcI=
X-Google-Smtp-Source: AGRyM1t+TdExhnnMI+mLfiAkiTPl8LWQ3Y1CWOWVm+aHxYvxPrlPfazeV7lXTU8dcPREu0/et5Bt2Q==
X-Received: by 2002:a05:6512:31c8:b0:48a:9c62:9270 with SMTP id j8-20020a05651231c800b0048a9c629270mr261853lfe.221.1658755208243;
        Mon, 25 Jul 2022 06:20:08 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id v15-20020a2e87cf000000b0025de6edd4a0sm1093894ljj.83.2022.07.25.06.20.07
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 06:20:07 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 26PDK4WT016291
	for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 16:20:05 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 26PDK487016290
	for openbmc@lists.ozlabs.org; Mon, 25 Jul 2022 16:20:04 +0300
Date: Mon, 25 Jul 2022 16:20:04 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: IPMI sensor names with VMware ESXi
Message-ID: <Yt6YhAPcHfmEFtUz@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

We're facing what might be an interoperability issue between OpenBMC
sensors exposed via IPMI to the host system and VMware ESXi (version
7.0u2).

The official document[0] states "All hardware sensors that conform to
the IPMI standard are collected. Third parties do not need to add
software providers to take advantage of this functionality."

And indeed they are collected but the web-interface, WBEM via https
and "esxcli hardware ipmi sdr list" all give "Unspecified 1" for all
the IPMI sensors "captions". At the same time "/opt/ipmitool/ipmitool
sdr list" from https://vswitchzero.com/ipmitool-vib/ shows all the
names properly.

When the M.2 SSD with this system is removed from our server and
installed into a very similar Wiwynn Tioga Pass board running AMI
MegaRAC and their UEFI implementation, all the sensor names appear
without any tweaks.


I'm having hard time trying to obtain any related documentation or
source code, can't for the life of me find any clue about their CIM
configuration. Is it using some undocumented SMBIOS entries (I see a
bunch (117) of "type 192, 23 bytes" but no idea if that's related)? Or
probably some ACPI tables? Or something specific it doesn't like about
OpenBMC's IPMI implementation?


Surely it's not the first time OpenBMC is used with ESXi so please
share your hints.


[0] http://www.vmware.com/files/pdf/techpaper/hwhm41_technote.pdf
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
