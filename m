Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D488091
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 18:54:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464rtJ5vB8zDrKj
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 02:54:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="H+GOgDFG"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464rsg436kzDrHP
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 02:53:26 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id y8so3074980plr.12
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hPL8uKV8w7E6vKQCKsPkzNi2HZFzHUa8eOLXCbOk78Q=;
 b=H+GOgDFG20MwjAursPHCV9PV6HHsuSrNGzqxTmq5Z5HZTedDTPjIIGBAFtxD1DQC4+
 sAqu3V0ndTVlNARcWdw6u4qr/BhC3cxdFqezSNRrbKOLTIbmSYAYpMseqR4TtGOCT8Ei
 hP3RdBguZmKFKRookC2loF4qix2quPPA1wywMeYxVShLgPRSV5d9ymnjDaIOoKcQD6uA
 FELZ+NX2aNRtO3ODtrj621NeZAcK6y5/C/eztU5mKgDtUHbOjNeXxqQ15iU+svUElXra
 uf7O+3eNf6g1UaosaDlazVrW/OeMxWcW9Ztvc2+X0ZZ52akFeKpkrUaA7H4z8AdbMUL3
 4fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hPL8uKV8w7E6vKQCKsPkzNi2HZFzHUa8eOLXCbOk78Q=;
 b=AuTtXs2j7q5j/eJQDebm2fmBQAY5C1DBZ6OMo0CgJ2m1DslFQ4RPsWijiK+tSREG/x
 NWdXwlxnw6pC3LJnoUzwprLY+ZUO1JV3RQRicXroUeRKmpxqgBXUb9CvBWT6Bf8/oTLu
 mEXN2OQcb4mJQF2fJMfGPcwnZslcKvXAHegTYisFuWIV1Q4hJlpvexkmo21HB/+X9CGa
 +SNtEwDq6GQ2q1n27dWE2LvdpNMANdoWzW3ngbSdVGppBfQ68u/AQ4EargFd4lWEL2RD
 UYRvTSgFGCccts8BTRHuw+B4zNntIOTr4cK2/WrTIoGTEq2VKhX7uPkGmZulaRerlVcs
 NN1g==
X-Gm-Message-State: APjAAAXuDVUsKuUlqlPyTSp3TCKHFtNSsc9rov8sgjhalZXRCnYKfuP1
 qCV+OsUB4IHSDGurb3r8rPCHVV7StD0uCA8WOXWKdw==
X-Google-Smtp-Source: APXvYqyBkm1wpSlkrP6eHqMz6pCtyjxt1uVCfvdQrOcil4nycze24epDVvHJyTqqB6CIDLVOlz+295pDG5OVtUoHVrg=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr19720353pls.179.1565369602476; 
 Fri, 09 Aug 2019 09:53:22 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Aug 2019 09:53:11 -0700
Message-ID: <CAO=notycFS1Zhjjt_n5J+mQwLTToZYwW-SM-FKQ-aaeSs4hMUw@mail.gmail.com>
Subject: entity-manager unexpected handling of template parameters
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Given the following:

busctl introspect --no-pager xyz.openbmc_project.FruDevice
/xyz/openbmc_project/FruDevice/Altie
NAME                                TYPE      SIGNATURE RESULT/VALUE
            FLAGS
org.freedesktop.DBus.Introspectable interface -         -
            -
.Introspect                         method    -         s
            -
org.freedesktop.DBus.Peer           interface -         -
            -
.GetMachineId                       method    -         s
            -
.Ping                               method    -         -
            -
org.freedesktop.DBus.Properties     interface -         -
            -
.Get                                method    ss        v
            -
.GetAll                             method    s         a{sv}
            -
.Set                                method    ssv       -
            -
.PropertiesChanged                  signal    sa{sv}as  -
            -
xyz.openbmc_project.FruDevice       interface -         -
            -
.ADDRESS                            property  u         82
            emits-change
.BOARD_LANGUAGE_CODE                property  s         "25"
            emits-change
.BOARD_MANUFACTURER                 property  s         "Inventec"
            emits-change
.BOARD_MANUFACTURE_DATE             property  s         "Thu Jul 11
17:09:00 2019" emits-change
.BOARD_PART_NUMBER                  property  s         "1051867-01"
            emits-change
.BOARD_PRODUCT_NAME                 property  s         "Altie"
            emits-change
.BOARD_SERIAL_NUMBER                property  s
"ALTIVT192700026"          emits-change
.BUS                                property  u         1
            emits-change
.Common_Format_Version              property  s         "1"
            emits-change

I expected entity-manager with this profile to populate dbus properly:
configurations/altie.json
{
    "Name" : "Altie",
    "Probe" : "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 'Altie'})",
    "Type": "Board",
    "xyz.openbmc_project.Inventory.Decorator.Asset": {
        "Manufacturer": "$BOARD_MANUFACTURER",
        "Model": "$BOARD_PRODUCT_NAME",
        "PartNumber": "$BOARD_PART_NUMBER",
        "SerialNumber": "$BOARD_SERIAL_NUMBER"
    }
}

Instead:
root@semitruck:~# busctl introspect --no-pager
xyz.openbmc_project.EntityManager
/xyz/openbmc_project/inventory/system/board/Altie
NAME                                          TYPE      SIGNATURE
RESULT/VALUE                             FLAGS
org.freedesktop.DBus.Introspectable           interface -         -
                                    -
.Introspect                                   method    -         s
                                    -
org.freedesktop.DBus.Peer                     interface -         -
                                    -
.GetMachineId                                 method    -         s
                                    -
.Ping                                         method    -         -
                                    -
org.freedesktop.DBus.Properties               interface -         -
                                    -
.Get                                          method    ss        v
                                    -
.GetAll                                       method    s
a{sv}                                    -
.Set                                          method    ssv       -
                                    -
.PropertiesChanged                            signal    sa{sv}as  -
                                    -
xyz.openbmc_project.AddObject                 interface -         -
                                    -
.AddObject                                    method    a{sv}     -
                                    -
xyz.openbmc_project.Inventory.Decorator.Asset interface -         -
                                    -
.Manufacturer                                 property  s
"$BOARD_MANUFACTURER"                    emits-change
.Model                                        property  s
"$BOARD_PRODUCT_NAME"                    emits-change
.PartNumber                                   property  s
"$BOARD_PART_NUMBER"                     emits-change
.SerialNumber                                 property  s
"$BOARD_SERIAL_NUMBER"                   emits-change
xyz.openbmc_project.Inventory.Item.Board      interface -         -
                                    -
.Name                                         property  s
"Altie"                                  emits-change
.Probe                                        property  s
"xyz.openbmc_project.FruDevice({\'BOA... emits-change
.Type                                         property  s
"Board"                                  emits-change

I must be doing something obvious and silly.  Please advise.

Thanks,
Patrick
