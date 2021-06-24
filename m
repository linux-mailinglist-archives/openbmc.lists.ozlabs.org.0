Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D34743B2ABB
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 10:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Ykt4Q7Hz2yy9
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 18:51:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uCNeeD/b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uCNeeD/b; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Ykc0rXqz2xZ2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 18:50:47 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id c11so6690802ljd.6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QuSUC9Zpb9IdRrN55XKR+6/Nm59RPUQfLFREWrsqLYE=;
 b=uCNeeD/be8TJrdHEs84rfsP7dKdhGLnyaqg0uQIwHyuDV17PPD3NEmSW45NB3eNaiS
 ydaDQPjddlid+ojpJvcr1L47sfa8eXN9XcK1jyNPkPl2Y8s+UG9I79OimYnfD4hMdLOP
 gUSJhwkBTh5qobjTnRJQjRnCcwhFjXTmEockv383CLfSw7j9W7Z+1He9ZPI1VTgxHgFP
 S2VTv69Q5oKLpnfsyfLd9S54PFT8aE4eEdjkmNadHKtg5Gkzcg34q3o4SUmIwNjBTSwK
 UIJ8sniwwomE4/OkEIqFFre8y1+F8WsDk/bqtZyryJNoVxYcIs5MKFvTho2890km2SPk
 r87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QuSUC9Zpb9IdRrN55XKR+6/Nm59RPUQfLFREWrsqLYE=;
 b=tk7CZtwZ1/jctgU55WbtmJH2gEKX0NVBv/JeX9TEr5xRoKw1v1AgYsNVupzfAb3PiL
 okuJz7bu2d5HPcMkBziTKLJnP0YyHnh9nNZdnch6qBIvZcfJ7UACxUo+ya5oJ+SUXgsS
 /WYPhNKK1whhxR/qBRhx0o51jnpYshxf+uneQZQsuh/A2twXhDWk1GllVLq3Fxs53CP9
 880SfL/uQO2tJaUGvl+ndPZF3wOGQjGrldMC/I9HfOKIL2teea0evRoPlyx8yOU7d5mu
 dO/B+fsBLd7RcRbN8bS5IcUqCNsYWh6I8/CLYGo6FNdHvRdGatUxM5KwmscNuNBvF6tA
 RMKQ==
X-Gm-Message-State: AOAM532BPN7K0B7GjOygBzzYaQmsdsJluwI9y92aNJn0JSj8UPcUXn/s
 5E0AjrpZkDpNgU6mrs8dPRg3yCjy51s+U3w6yMA=
X-Google-Smtp-Source: ABdhPJx4fvfS+en+u4znqJ05sHH8N34jDDwPok+zHemf0rS9R7/u/KByxTvY8yYwnipd0w2GeTShqejz5uoHGsUUF88=
X-Received: by 2002:a2e:9bd3:: with SMTP id w19mr3120447ljj.381.1624524642725; 
 Thu, 24 Jun 2021 01:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB23393424624A1F752D3BDAAB8F079@HK0PR04MB2339.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB23393424624A1F752D3BDAAB8F079@HK0PR04MB2339.apcprd04.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 24 Jun 2021 16:50:31 +0800
Message-ID: <CAARXrtmf2S+oma1_60=pkHCEMFBAxFP4dSVSnR6Nqurt1PFEgg@mail.gmail.com>
Subject: Re: IPMI SEL logs from phosphor-logging
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 Brandon Kim <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 1:21 PM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi Lei,
>
> I enable SEL_LOGGER_SEND_TO_LOGGING_SERVICE option for phosphor-sel-logge=
r and then would generate IPMI SEL logs from phosphor-logging successfully.
>
> But the phosphor-logging still has other events issued from elog function=
 and also put them in the "/var/lib/phosphor-logging/errors" directory.
>
> For example:
>
> 00000000  03 00 00 00 03 00 00 00  03 00 00 00 67 ff e6 38   |...........=
.g..8|
> 00000010  7a 01 00 00 32 00 00 00  00 00 00 00 78 79 7a 2e  |z...2.......=
xyz.|
> 00000020  6f 70 65 6e 62 6d 63 5f  70 72 6f 6a 65 63 74 2e   |openbmc_pro=
ject.|
> 00000030  43 65 72 74 73 2e 45 72  72 6f 72 2e 49 6e 76 61  |Certs.Error.=
Inva|
> 00000040  6c 69 64 43 65 72 74 69  66 69 63 61 74 65 01 00  |lidCertifica=
te..|
> 00000050  00 00 00 00 00 00 09 00  00 00 00 00 00 00 5f 50  |............=
.._P|
> 00000060  49 44 3d 38 37 35 34 00  00 00 00 00 00 00 00 00  |ID=3D8754...=
......|
> 00000070  19 00 00 00 00 00 00 00  76 33 2e 37 2e 30 2d 34  |........v3.7=
.0-4|
> 00000080  2d 67 66 32 36 39 36 39  66 64 34 2d 64 69 72 74  |-gf26969fd4-=
dirt|
> 00000090  79 67 ff e6 38 7a 01 00  00                     |yg..8z...|
> 00000099
>
> This event type is not IPMI System/OEM SEL, so "ipmitool sel elist" would=
 result in the unspecified error:
>
> # ipmitool sel elist
> Get SEL Entry 0 command failed: Unspecified error
> Get SEL Entry 0 command failed: Unspecified error
>
> How do you deal with these events that not belong to IPMI SEL logs ?

Such logs are mapped to the system sensor as "Undetermined system
hardware failure".
e.g.

  23 | 06/21/2021 | 06:26:35 | System Event #0xf0 | Undetermined
system hardware failure | Asserted

See https://github.com/openbmc/phosphor-host-ipmid/blob/master/selutility.c=
pp#L365
for details.

So you need to define the inventory sensor of
"/xyz/openbmc_project/inventory/system" in the system's
ipmi-inventory-sensors.yaml, then such events could be mapped to this
inventory if there is no CALLOUT or no SEL metadata in the logging
entry.
