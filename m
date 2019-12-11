Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B311A441
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 07:00:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XmVy738GzDqkW
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 17:00:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cgc8Uoch"; 
 dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XmV95GyNzDqk9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 16:59:44 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id b15so18383598ila.7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 21:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njfiwREQVZsK7Lq/p1k68jPh6AdLrxXBQhqVFxTOrCg=;
 b=Cgc8UochDnhnr/6sPrjmcXY5G/o13stuEtFsYUPLid+ByYejgAnd99BwkwLOiOpWCQ
 catpaIosChcSytsLboBCrnsfoW3uc/hY4MbAggAN58p2BClbASxAiBZxV3nwNLtoejy1
 +Gcm3/Ys4+NLrBsEljkqDlHTBrv9zOaTVLC4WT/MA0C9N/DpEYQq/kUY7LE3NB7nziHc
 XA8VDnHOw/TZ2RxzsL8UBc1Sk4rlzu69nrUyFJG8SSqt5UJAxE5Fo4ZolSddmu0c1PNU
 FJPq/k+2bT9Pnu3hIeZCAo3Ggw1Isx5ActoWCpgeG6p5jjkO//pf4SbmHN/BZKkh8kSQ
 hldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njfiwREQVZsK7Lq/p1k68jPh6AdLrxXBQhqVFxTOrCg=;
 b=NTaeiW+/E7CLAik89bE+i2kv2db4HAY2X0bIID/2crJxadDn2xdaMyBnIr2ofBq3nC
 CSIKFatoG+q1kIs8BXykk+EnCJ+GuI5Hm45TW6e6JjKEemqQNCZwhJpx3p8JWiTQjAlS
 Iod3BhWgPXgtbXux2JzEztTx8pC3n1ZOY2XI76rUfNmXLI51+BZnfTAbsriiL0YHCf8l
 U11rJwz8JczeG7wffPwqQfRe7iqNNeqPkIov4+y5k4oEIQzk6XNgIFaz1CXSwTtyR2Mq
 pcZI3A5qQx6fbTEHv9GnQ4HUtkSJeq7X0tOnsaflFSzqEf8AgWoXseaSCMOabw/+/IP1
 t1uA==
X-Gm-Message-State: APjAAAWwaFrrCid5KyQIRV6gY6MMq3iDxv8bvVt9o+p6GiuwdLqvquet
 i3W7C/2k7rZ7u8u/g7C+JHNcO7+/zCIG2r4sIgo=
X-Google-Smtp-Source: APXvYqzHWWRZ1LwqFgk+1RrZYQsDntd62JUYB8z1Q2nJRQaVmbXlEEySMBKBDEgwVK/pyrjFDvVtKDRoyrUhaW+U28Y=
X-Received: by 2002:a92:7981:: with SMTP id u123mr1544171ilc.138.1576043981150; 
 Tue, 10 Dec 2019 21:59:41 -0800 (PST)
MIME-Version: 1.0
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
 <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
 <DM6PR21MB1388F87CA03203F0C5F9F331C85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <b13a3d03-333b-e5b7-b6b1-28159f233a2d@linux.ibm.com>
 <HK0PR02MB27870548BFF1A91BC86ADC19F85A0@HK0PR02MB2787.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB27870548BFF1A91BC86ADC19F85A0@HK0PR02MB2787.apcprd02.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 11 Dec 2019 13:59:30 +0800
Message-ID: <CAARXrtkKT=KHAQ3DPTh_CoSCCLGjojC73-v6L+a4XY94pbE3RA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: BMC update via TFTP
To: "Bonnie Lo/WYHQ/Wiwynn" <Bonnie_Lo@wiwynn.com>
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
Cc: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Aldofo Lin/WYHQ/Wiwynn <ALDOFO_LIN@wiwynn.com>,
 Neeraj Ladkani <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 12:58 PM Bonnie Lo/WYHQ/Wiwynn
<Bonnie_Lo@wiwynn.com> wrote:
>
> Dear Joseph,
>
> In my understanding, the BMC firmware update flow is as below:
> 1. Trigger reboot
> 2. Systemd stop all service
> 3. Unmount file system
> 4. image is in /run/initramfs
> 5. Do the flashcp command to update the flash
>
> If there is any misunderstanding, please correct me.
>
> Based on the discussion with Neeraj.
> We want to be able to update BMC firmware without having to trigger the BMC reboot command before the system do flashcp command.
> It means that we can do the flashcp first. If the flashcp command complete and success, then we do the reset manually.
> Is it workable on current upstream code?
> If not, why? I means is there any advantage to trigger the reboot before we do the flashcp.

It is not safe to flashcp the flash chip while BMC is running on it,
because BMC's filesystem is mounted on the flash's RO and RW
partitions.
