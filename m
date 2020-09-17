Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3531F26E90C
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 00:41:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BssQV2vSmzDqg7
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 08:41:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SBn9YkwA; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BssKq5k7BzDqgB
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 08:37:33 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id o8so3533981otl.4
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=miE6/0FOXkmbfawU9tD+wFTB92799UKNTBYXMDTfC6E=;
 b=SBn9YkwAOWMkYUGCpRjh09zL31OfTpLmXuEDGmZLxRb6mqvQifbG7ZmPiR7F9+QsgU
 fkrwqqfoG1Op+R/N0S/dsWMmfQM9QtjYtuqKlrKHClaoQ67Uv8vQV+EHcm+Qan0KhxJD
 zi9+VQFGq3b3lg3yhQkV9xWFphrrPVf9s1GGZmCSL8FOrJpGKd0YDF8hlofwgY0du+pq
 VPBaJUzysod7MBeANcGTeXz04KuXHZOJhBWJcWBggGQ/A0Pzy8haeHwfL3N8DRChvCRY
 m66r5T5GHFV51dsk+cZ5v3IVj+K7so+l6BH7RNSBp7wq1+rA6SaDAgDd39p5KM/Zcald
 XLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=miE6/0FOXkmbfawU9tD+wFTB92799UKNTBYXMDTfC6E=;
 b=qMLazFBiX1qPTIolsvgX/m/RaAMT2WoP6JI5vwjj3XeT4L1N++RpvCNl/V4MPkNgNB
 HAEIEAhmPw2/WZPY74fFlGkfxGv1/y1Kksurdf+XR6q7FuNZBNl8+gCTXhH1iUNHUCu3
 Lye4C8rMVoptuW9IXIDU1g23Drlo3Q/+KTPTnsI8Ho3TDC9PPQSkeZLFifUx/bqYnOJf
 /k3apWxRs8tXNDcMuPM+Cch5WwFjnVPNlt2x/S9F6SaGVnrkSeZcqKeOQkFLdl9SzKb4
 am3VPk4soPNVsRT7BbzUl7buNXyqHjPJM/iCCLMxuQOdaBfGAiZNQXwyPEfDak0PjCgu
 YTyg==
X-Gm-Message-State: AOAM5331pK/SfnFWV8XQ3I0LzsDSCGaFu01lFjiWJg9NpR8zdQ2wfyDr
 E53YmOmo71v3IlXiT10JetWEFEMkxTYfyg==
X-Google-Smtp-Source: ABdhPJwlb0ncPmTNUk0gL2AYwhNJmdzWwMX/ymRDGMzySGRhS3dUqbpl9SsPY+dkqqECPhRiHknUHA==
X-Received: by 2002:a9d:5a91:: with SMTP id w17mr21857221oth.345.1600382249761; 
 Thu, 17 Sep 2020 15:37:29 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:bddb:185c:e5af:3156?
 ([2601:281:c001:2359:bddb:185c:e5af:3156])
 by smtp.gmail.com with ESMTPSA id o13sm850563otj.2.2020.09.17.15.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 15:37:29 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Removing watchdog and ipmi
Date: Thu, 17 Sep 2020 16:37:28 -0600
Message-Id: <A95174F3-C332-4F61-95B7-D10B509ED98C@gmail.com>
References: <efe167d3-8bc8-0740-2e6b-dcfadee18a4e@linux.ibm.com>
In-Reply-To: <efe167d3-8bc8-0740-2e6b-dcfadee18a4e@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
X-Mailer: iPhone Mail (17H35)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joseph,

I was able to get watchdog out, thanks.

I still can=E2=80=99t reboot through the webui, but that is probably because=
 it eventually a service expects the host to chat over ipmi. However, I see m=
y supplies power off and prove my host-poweroff.service works, confirming ho=
w things are connected.

Since my goal is to demonstrate how to integrate my products, this is probab=
ly good enough. But it does show that a system design without a host has mor=
e plumbing required to get things to work. For an FPGA or ASIC it might be a=
 service acting like a host but monitoring GPIO pins.

If anyone knows of a similar service that plays the role of host, I would li=
ke to look at it.

Mike

Sent from my iPhone

> On Sep 17, 2020, at 4:25 PM, Joseph Reynolds <jrey@linux.ibm.com> wrote:
>=20
> =EF=BB=BFOn 9/16/20 4:55 PM, Mike Jones wrote:
>> Hi,
>>=20
>> What is the proper way to remove phosphor-watchdog and ipmi from a projec=
t?
>=20
> I'm not an expert, but it seems like you would create a bbappend (maybe in=
 the raspberry pi layer?) for https://github.com/openbmc/openbmc/blob/master=
/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb
> This append would undo the effect of: RDEPENDS_${PN} +=3D "virtual/obmc-wa=
tchdog"
> In this way, the phosphor-ipmi-host package would not pull in the watchdog=
 package.
>=20
> But you probably just need to remove phosphor-ipmi-host and phosphor-watch=
dog (via virtual/obmc-watchdog) will no longer be pulled into the image.
>=20
> To remove phosphor-ipmi-host you would do something like: DEPENDS -=3D "ph=
osphor-ipmi-host".
>=20
> I hope someone who knows will tell us how to really do it!
>=20
> - Joseph
>=20
>> The goal is to not have the watchdog interfere in a raspberrypi project b=
ecause there is no host, and there is no need for ipmi for my purposes.
>>=20
>> I have created host-poweron and host-poweroff services and can manually s=
tart/stop them and see my regulators go on/off. I want the webui server powe=
r widget to power on/off using these services, but I think the watchdog is i=
nterfering. My understanding is obmc-chassis-poweron/off will trigger host-p=
oweron/off.
>>=20
>> Based on meta-quanta, I don=E2=80=99t see any other services I have to de=
fine to hook up host-poweron/off. This is why I think removing the watchdog i=
s enough. But if there is any other interfering factor in a hostless system,=
 I need to know that as well.
>>=20
>> Mike
>=20
