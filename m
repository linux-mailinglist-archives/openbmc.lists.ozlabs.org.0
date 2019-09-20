Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF2B8938
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 04:22:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZHY568HRzF4yJ
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 12:22:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BcBbcXmT"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZHXD1s8ZzF44n
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 12:21:31 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id q1so12733883ion.1
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 19:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z2FwdQ1UvLQGnl3/+C1SWY/EurSEZc/u4BcQ5LgSZ8I=;
 b=BcBbcXmTIzxvFk5vwjuYMv698BHtpxqyo22uLp1xFvp9va37fN3C6EaX0VvVsreqrc
 /MQg3Gevsph4fkb11N95hrB5EbnN+AEuSA6tdB67hOhi7UMolISV6auIrJO0LFbJW6qq
 UCwoeuhJvaR5UUugqfqYd92lUUXsxeZ+rQXEAcfvq4F5C6tfpzlReRcncgrg+tpwSbwu
 jsu0ZzJdPxDZ6SB8OUIe31xdLGTc0T/MHOob+9IcdFvJQRMdzMwIIEAHxLkbHAp0C5Rc
 IFb5nxypHXmkweW2b7ihSPW1m2FiY+kxV5n7mQV/5CNhR5AXfKPR+DZ5KXfv62mnKSC1
 HFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z2FwdQ1UvLQGnl3/+C1SWY/EurSEZc/u4BcQ5LgSZ8I=;
 b=E7eGqx7iREGGSrDTZURWnaXhzzNm4TbhiZjAveQtoUuBABVW8A79Ko5PdTSbGJt6ZJ
 8DvPUBGZfiLDjknuiXC76otGH1bQ3D3URszvVl9Z8YURsn4VI9zbCYPm1uvRHPuVXUp+
 OYgJuQNjEeyozTJxWCWdWYtxdIhMMtifJFmkjqhIkGdZ53g8CK7pAlkd0SMly2560w0Z
 u0dHe0pcmcVBzGGQCWkvFxz/QvWd6kHsY8Qx7vIp6aERKMHBZkWgqaof88l7/5xT5Sze
 LtNz5qwE1nELNSWUdJYoICmCi2evAApobh+CpiNJqpwGVGxJhAKL8YOMhiKq6ne6Mr04
 t3Zg==
X-Gm-Message-State: APjAAAVB5vMS7B06JAk+xSZxL+sEsPyuQUd/l/1TbFkY18h3VJqDFNyt
 LX35+By4e4GJq2If7c4ZKiM0YRqSykYcSwoH1f0sMgl3jPc=
X-Google-Smtp-Source: APXvYqyQVDvUkFlRlcTQr1iT/RWfEDrACI+yunTcmiAdfcjlgeKhs+ngPBehaReJFH4ZBnG+7TVn3YMAL4IfJWbK2yo=
X-Received: by 2002:a6b:720a:: with SMTP id n10mr6174001ioc.64.1568946086479; 
 Thu, 19 Sep 2019 19:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <90E110C3-D171-4E85-9558-D1A0631C265A@fb.com>
In-Reply-To: <90E110C3-D171-4E85-9558-D1A0631C265A@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 20 Sep 2019 10:21:14 +0800
Message-ID: <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
Subject: Re: Machine name in Code update
To: Vijay Khemka <vijaykhemka@fb.com>, Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: "ed.tanous@intel.com" <ed.tanous@intel.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Ben Wei <benwei@fb.com>, Amithash Prasad <amithash@fb.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2019 at 2:15 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Team,
>
> I am trying to add a feature of verifying machine name while upgrading BM=
C image. I have submitted a couple of patches, 1. Which adds machine name i=
n manifest file and 2. Which verifies machine name from manifest to os-rele=
ase file. Below are 2 gerrit review patch.
>
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/25324/
>
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-bmc-code-mgmt/+/2=
5344/
>
>
> I have received some valuable feedback on design approach and I agreed wi=
th some of them. Let me explain complete thought here and please provide yo=
ur valuable feedback as well as new ideas.
>
>
>
> Currently available:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Currently, Software updater updates image based on version reading and pu=
rpose from manifest file.
>
> I find here a security issues of upgrading an image which was built for d=
ifferent machine and upgraded to BMC with different platform.
>

+ @Adriana Kobylak

And here is my thought:
* Initially I wanted to add such check to make sure a BMC is not updated wi=
th
  a different BMC build.
* Later the signature and verification code is added, and the tarball conta=
ins
  signatures.
  In practice and in field, the deployed BMCs will not be using the "defaul=
t"
openbmc key, and thus any update shall be using a signed tarball. The one w=
ho
generates the signed tarball shall make sure the build matches the machine.

So I think the "security issue" is not really a problem.

But I still like the idea to check the machine name to prevent incorrect
updates accidentally.

>
> Design approach:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> As I see that while building image, there is a /etc/os-release file which=
 gets created and includes version, machine name as OPENBMC_TARGET_MACHINE.=
 This machine name is nothing but a MACHINE defined in bitbake environment.=
 So I thought of using same MACHINE value to be appended in MANIFEST file w=
hich is being parsed by updater. And verify this against running image rele=
ase file before validating image. There are following question comes here.
>
>
>
> Backward compatibility : For this we can allow image upgrade if machine n=
ame is not defined in MANIFEST file or if it is defined than it should matc=
h to current running image.

Yes, I prefer to keep backward compatibility for a few release cycles.
E.g. in 2.7 and 2.8, let's make it support tarballs without machine name.
And in 2.9, make machine name mandatory.
What do you think?

> Validation level: Current code updater supports upgrade for host, bmc and=
 psu all firmware. So I am not sure if machine name is going to be same for=
 all components or it is different. In my understanding, all components sho=
uld have same machine name if they are part of single machine. I am open to=
 discuss this point as I am not sure how everyone else is defining it.

I agree with this one.
Adding machine name for all tarballs (BMC, host, PSU) makes sure the image =
is
for a specific machine.
Even if an image is meant to support multiple systems (e.g. a PSU image may=
 be
used on different systems with the same PSU), the update image could be
generated (and signed) for the specific machine as well.
