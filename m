Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBEA1E9C04
	for <lists+openbmc@lfdr.de>; Mon,  1 Jun 2020 05:25:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49b0sm0SD2zDqVW
	for <lists+openbmc@lfdr.de>; Mon,  1 Jun 2020 13:25:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=B4x3mcb9; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49b0rz1D19zDqJB
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jun 2020 13:24:16 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id z13so6325920ljn.7
 for <openbmc@lists.ozlabs.org>; Sun, 31 May 2020 20:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gpL0K/fOIgjnqloK3AKobZHZxXgeBLhejdVNP8qv4sw=;
 b=B4x3mcb9kZrWfQbMINWOr+ObGpARIFOOuSCggkFQ2h/fp65KjApOh2jj5PbYOJ4wn8
 +8/8Xec5h1EAzp9lUO/nkAfojIiIE5WSTq60ob2yw5Ln5eDEkTJyv86VLegmT5Pu0PoN
 a/wKKm+9ukGXc2wXVDjAhRohcJ+R3G+oxbKlKmqyWfM83pv8ub8FxE50B0CiBGtuOg0h
 X8whQf4/tmimwavhDf746DOc27wB/lpU691WKQmHH57QKGly6c74cehEvv/VIdIOkfFV
 USuKDT+SaruDb/BYGm8mF7AfpzYkF1pOLvk6hoBpm6RYXC2quJL7btQz1ybmAFSvdVBH
 6EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gpL0K/fOIgjnqloK3AKobZHZxXgeBLhejdVNP8qv4sw=;
 b=VlDthACKIJs1fXtLm0QZJyC0OlJz1QuTc1hv1v3MkQhXmxez1ShtZJrfFVFn4OssQQ
 eik/lZEyPlJsiXDIAjxy2vpWKPKn8ARFSieBfE6QfvOSqcQBrQGvU6d8WiugzTzV0ckO
 VmX9ciIc+0dwgDayoeix/Q/GwxaSQM2fyvTGWkRRylxNQOuXDm3S2ZHMUn1gPmRkMAUm
 6qFnc1KkMIC/VoIXYZBB4Ebz85uxJsXbfY3BncZAmIylwnIPXRkT93wgY5ns523JcflO
 BGnMgbI8tndHJKaQ1bkjmZ9Dbm7uLETcNAj6LJzJjnD4pYM2xoD+azNQYH8vMnF/C2pZ
 o9Ag==
X-Gm-Message-State: AOAM530jyCMU+hI5+DHuQ52xf55Ave8IZRy+/nSj1MzHAsoSNXnN2Grq
 lGxxEfvqDvPE+1euH0eCs4+VQiBfHxPwwVL5YBzeAA==
X-Google-Smtp-Source: ABdhPJxQKZIQej75VU0/0vJOmirA+Hqod+E+g6OfVwKD73f4rMdg9MyfVP8xVLtARiIlTN6DsdDkGPin1vSexsaQNx8=
X-Received: by 2002:a2e:8ed8:: with SMTP id e24mr3266749ljl.194.1590981848586; 
 Sun, 31 May 2020 20:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
In-Reply-To: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Mon, 1 Jun 2020 11:23:57 +0800
Message-ID: <CAGm54UE6R3cArEgurxr0iMJwL-p29Ba6jFaqUxJ7zjTWNdgaNQ@mail.gmail.com>
Subject: Re: Sd_bus_call - ELOOP Issue
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
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
Cc: vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org, anoo@us.ibm.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, May 30, 2020 at 12:00 AM Kumar Thangavel
<kumarthangavel.hcl@gmail.com> wrote:
>
> Hi All,
>
>         We are handing the ipmi commands (Bridge IC request) in the ipmi =
module.
>
>         Please find below the gerrit links for the Design and Sample code=
 implementation of BIC request handling in the ipmi.
>
>         Design : https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ho=
st-ipmid/+/32213
>         Sample code implementation : https://gerrit.openbmc-project.xyz/c=
/openbmc/fb-ipmi-oem/+/32215
>
>         So, This is regarding the ipmi implementation issue as per the ne=
w design of handling BIC request.
>
>       1. We are handling the command "0x38 0 1 6 0x15 0xa0 0 0 6 1 0"  Ne=
tfn =3D 0x38, cmd =3D1 is from Bridge IC in the ipmi module. In the ipmid, =
we are making new callback(ipmiOemBicHandler) to handle this BIC request.
>
>        2. The Netfn=3D 0x38 and cmd=3D1 is verified, we are getting the c=
ommands from the BIC, the same is received at ipmb and ipmid also. The regi=
ster call back is also  called. When we fill up the response from the ipmiO=
emBicHandler works fine. The response is received at the BIC as well.
>
>        3. But as per the new design, we need to call ipmid command handle=
r recursively. When we get the Netfn=3D 0x38 and cmd=3D1 command in ipmiOem=
BicHandler, the handler needs to open the packet and there will be an anoth=
er command (for ex Netfn=3D6 and cmd=3D1 get_dev_id). ipmiOemBicHandler nee=
ds to send this command
>
>        4. In  ipmiOemBicHandler callback function we are using synchronou=
s method to create connection, using this connection we are calling "execut=
e" ipmid dbus method from the ipmid deamon.
>
>        5.  While calling "execute" method, internally it calls sd_bus_cal=
l function. Sd_bus_call returns ELOOP exception due to sender and receiver
>          process are same.
>
>        6. As per our understanding, current  sd_bus_call not supported fo=
r connection with the same bus/clients. (sender  and receiver are same
>            application name ). Please confirm.
>
>             Log :
>             yosemitev2 ipmid[370]: sd_bus_call function called..
>             yosemitev2 ipmid[370]: sd_bus_call function ELOOP .
>             yosemitev2 ipmid[370]:  unique name =3D :1.71
>             yosemitev2 ipmid[370]:  incoming sender =3D :1.71
>             yosemitev2 ipmid[370]: executeCallback called. catch block
>             yosemitev2 ipmid[370]: EXCEPTION=3Dsd_bus_call: System.Error.=
ELOOP: Too many levels of symbolic links
>
>        So,  Could you please confirm sd_bus_call does not support the sam=
e bus/clients with in the same process.

As far as I know, you could NOT make a sd bus call to the same service
when you are in the service's sd bus call.
If you really want to call the "self" service, probably you have to
"schedule" the call into the event loop.
