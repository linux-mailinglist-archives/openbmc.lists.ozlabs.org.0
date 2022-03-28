Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF464E97E6
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 15:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRtbN4T00z3c1S
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 00:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gACqMWky;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gACqMWky; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtZx17hhz2ynj
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 00:19:35 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id j83so15536408oih.6
 for <openbmc@lists.ozlabs.org>; Mon, 28 Mar 2022 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xf69RgBoGZiecgaFL+oOOPgNe95qczLmVWeHXlTXt+c=;
 b=gACqMWkyYf1BA0ZpMf1hHVaL+pFYXF86t2vQVbxEnSEJ/7wbpotM6UmNAT4qtE8smk
 C9zaki1Ur7EKQo0tke8uGOV2yQTtabaQ00Y9/24JrCbbbzLCw6Nb56P1zs248Jne21hb
 S7Lgj9qoRgS17a/h0QOBVJkvbyleHOv6JHIdZQ4OiD4RyqKOzzxIXp4wdCYbxfv8gpv9
 LgV12cp2S/cfEy1oeCTslDyDVCnoVbFl5KGErlnmI7jxvR07VAIs0vy9UbEY2V5WqKqq
 tZWX3w7xilVOELBBQmud/n1gYve78bftC8licdeAuVVVXSDsu5IryuF4XBdkono9A083
 vNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xf69RgBoGZiecgaFL+oOOPgNe95qczLmVWeHXlTXt+c=;
 b=3zGRJoSJxLEbfT1UOMcI0PlbzWuY93+R+fOKh9cuXqDS/QpvwJrW8xWj0yCsEPOZJG
 PDJQ/q/jLK1jA5c2foOM15b9AA6epoYHRtj/4ycTYxzc47uhtZ65GfbPdtKQuxYv9ZXW
 jYBWNMYx3yzKIYJ3RzvtUpTBWiEqQFPEXkws/O86r7JDWoMvGZLJNvIHVtxp/+zw4I80
 cQzurOsRjaIhlx4aLySETwoNBaoT2tGZCL/g6sHT1+da3FKq7Gp2bckzlDvAEO28wyyv
 9O7HiiytfPix9AAO9u8BqfdZM1EvqcrsN57A9iACQOwvtMPSifAHlQMbZRYoumeojN91
 TqQQ==
X-Gm-Message-State: AOAM531Fc4AolU9NYrc4D0NdVR7zxMThL5EyQVd5dsTcAbhASkxwl63W
 Qty+yrYrlUkvV0Hw8ZDKf2AFq1xSyddR2CY/ol//DTQN+tvrN74r
X-Google-Smtp-Source: ABdhPJxAWPUiHeHGzaP4PT//OAWEG+Ny789JySNKFVugoopbOqgRP7B1sjJ2Z0+ia5Zhw8O12gy6GOBvl+ZdKu4nzbc=
X-Received: by 2002:a05:6808:200e:b0:2f7:5c99:2f3d with SMTP id
 q14-20020a056808200e00b002f75c992f3dmr751658oiw.294.1648473572530; Mon, 28
 Mar 2022 06:19:32 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 28 Mar 2022 21:19:40 +0800
Message-ID: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
Subject: Missed interfacesRemoved signal callbacks in object-mapper results in
 invalidated DBus objects
To: openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

An issue that is related to missed match callbacks is noticed and it
causes the inconsistency between object-mapper and the dbus objects.

Steps to reproduce on g220a QEMU (it is not 100% reproducible and when
it occurs it likely occurs on the first try when BMC boots)

1. Generate several logging entries
2. Call logging service's DeleteAll
3. Check the objects of logging service, all entries are deleted
 ```
 # busctl tree xyz.openbmc_project.Logging
 `-/xyz
   `-/xyz/openbmc_project
     `-/xyz/openbmc_project/logging
       `-/xyz/openbmc_project/logging/internal
         `-/xyz/openbmc_project/logging/internal/manager
 ```
4. Check the entries via object-mapper, it gets the entries
 ```
 # busctl call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
GetObject sas /xyz/openbmc_project/logging/entry/1 0
 a{sas} 1 "xyz.openbmc_project.Logging" 8
"org.freedesktop.DBus.Introspectable" "org.freedesktop.DBus.Peer"
"org.freedesktop.DBus.Properties"
"xyz.openbmc_project.Association.Definitions" "xyz.open
bmc_project.Common.FilePath" "xyz.openbmc_project.Logging.Entry"
"xyz.openbmc_project.Object.Delete"
"xyz.openbmc_project.Software.Version"
 ```
5. I could verify that the DBus object does not really exist:
 ```
 # busctl introspect "xyz.openbmc_project.Logging"
/xyz/openbmc_project/logging/entry/1
 Failed to introspect object /xyz/openbmc_project/logging/entry/1 of
service xyz.openbmc_project.Logging: Unknown object
'/xyz/openbmc_project/logging/entry/1'.
 ```

I also added some logs in my service to get callbacks of the
interfacesRemoved signal, and it shows that I really do not get the
callbacks for some objects.
For example, in one test I have 41 logging entries, and my service
only gets `interfacesRemoved` callback for entry 18~41, this causes
the object-mapper to show the remaining 1~17 entries while they do not
really exist on DBus.

This looks like some fundamental issue in dbus-broker or sdbusplus.
Is there anyone who hits the similar issue?

-- 
BRs,
Lei YU
