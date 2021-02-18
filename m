Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170C31E7CB
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 10:18:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh8Jj1LCrz30Lb
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 20:18:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cwijspHQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=james.mihm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cwijspHQ; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh8JV1vyWz30KJ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 20:18:17 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id f6so1247581iop.11
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 01:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWnEWXHo2WFxd5XKiq/X+VLGh3ODmXdz2IEl+R8Zzk8=;
 b=cwijspHQGWJ44Z779Q4STzthiDbNfJwSIoUWoGhSdsUTETLHkz0BsAOP/a8BNkFQWC
 ZN1tW6aAjZFhAT5pkm8IPrSPQ+w2nauIaEsRp/1mWK6L22eZjuFwfC+ipduHWZbtdC0n
 abxcYEgZf5eBbDe8OYAJpLwSBcuafQ+mLnKkeCrRKyfwwoSIh64Om58b/FgC8L0L7xzj
 lc9fp4nHN41tRUHLT5Yuq9hgRT682zl4t7xVxvE9Qw+jPeZKslq/9luIlDJ4xkrmFXCH
 +9RNKWpjpnMWTbYNx/NquV5ESVG28C3cpG4lJLhRIJYP6tTeXqRg9gq6FG+vQcpfTq8m
 gTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWnEWXHo2WFxd5XKiq/X+VLGh3ODmXdz2IEl+R8Zzk8=;
 b=qVRuglEncQPy8dmLlzIfjIdvE9zkvkMqRggaU2dRRANomQat8UrbrD97/EmITVS7n2
 o4yDmgdSrp4vfmTgsU73+15/iB4QiitZF4uVghvRLBpvyCvPHmLXia2rKGwoOcu5+Fbi
 35qjCyROaRnaJm0EgBwaDHhxU7pjgc6w6Tf1yGZO66I17fgtRrZyTRc9Ntg8n4Vb00aj
 0r9LKVj1C/XjlJKpuQvaqVxRP0VgbneBy6IC6/7UTryy3VqcbQ0qofU6yFfz9ZUZ6r7V
 Xv6XD5UTwbaHox7aMSyCc5h98rxmtbTwB0xGZmn9qYa12Lwo3pczEZ3fO7Q5zyIiBTmt
 1xGg==
X-Gm-Message-State: AOAM532EBc571DPsjtMcxpmZhyyOsE3j7/ikOn26FaHm2woQM8XSs2c5
 5T8gxZ9cIGOqV0seffpP7LW/JlkmVslDHSmXDFz3LiKqFfitEQ==
X-Google-Smtp-Source: ABdhPJyC2yQ/8NLLcQ9rn0fInLvMjc1MIMzR+S2Lc81wlkLGbeHnEwu2mi2rkEOgOUbYjftpXJOE8xfeNBLwch8OhXo=
X-Received: by 2002:a5d:84d0:: with SMTP id z16mr2793049ior.114.1613639892447; 
 Thu, 18 Feb 2021 01:18:12 -0800 (PST)
MIME-Version: 1.0
References: <177b3af96fa.eaf65e85615103.194541248329848746@maxvytech.com>
In-Reply-To: <177b3af96fa.eaf65e85615103.194541248329848746@maxvytech.com>
From: James Mihm <james.mihm@gmail.com>
Date: Thu, 18 Feb 2021 01:17:36 -0800
Message-ID: <CADy_Pt36E8s8zqUOZwsn0vuOb7=5zxegAt6NthC5J5BrCkEw5Q@mail.gmail.com>
Subject: Re: What is OpenBMC ?
To: Daniel <sd2@maxvytech.com>
Content-Type: multipart/alternative; boundary="00000000000095b4ca05bb98d0dc"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000095b4ca05bb98d0dc
Content-Type: text/plain; charset="UTF-8"

Hello Daniel,

Welcome to the project. I'll try to answer your questions, and I'm sure
others will contribute as well.

The OpenBMC Firmware stack is a Linux distribution that can be thought of
as a toolkit for creating a firmware image that boots the Linux OS and
contains numerous drivers and applications targeted for a specialized PSoC
known as the Baseboard Management Controller (BMC). The OpenBMC project
uses the Yocto project (www.yoctoproject.org) which uses Openembedded (
www.openembedded.org) as the build automation framework to build the Linux
distribution.

There's not a simple answer to the question of what prerequisites a target
BMC should have. It all depends upon your use cases and requirements. Most
high-end servers contain the PSoC version of a BMC (e.g., ASpeed
AST2500/2600 or Nuvoton NPCM7xx/NPCM8xx). Which have three functional
component blocks consisting of what was referred to as the southbridge in
the Intel Architecture (i.e., USB, keyboard controllers, UARTs, PCIe, SPI,
network, ACPI, etc...), a video graphics controller, and then the
management controller itself. If you don't need the video controller or
southbridge, there are other controllers available. The key question is to
determine what your requirements are and to look for a controller that is
already supported in the Linux kernel. ASpeed and Nuvoton also make lower
cost and simpler BMCs.

Can you install a BMC on an FPGA board?
Yes, but the hardware requirements are dependent upon your use cases and
the controller you choose.
Here are some basic hardware requirements off the top of my head. I'm sure
I'll think of more after I send this email.

   - Power the BMC on standby power - separate from the income-producing
   payload
   - Have a well defined power-on-reset sequence for BMC and downstream
   devices
   - Perform a threat model of your design and provide mitigations to the
   threats that can be exploited to cause a DOS or PDOS of the product.
   - Provide hardware to allow programming of the memory device while
   in-circuit (e.g., SPI flash or eMMC).
      - Isolate the power plane to the flash memory device(s) from the
      power plane connection to the BMC and other devices. This is needed to
      prevent the programmer from sourcing power to the entire board when
      programming the memory device while in-circuit and board power is not
      present.
   - Define your I2C bus topology so as not to create excessive traffic on
   any bus.
      - Group I2C devices according to function (i.e., power supplies on a
      dedicated PMBus)
         - Be careful not to exceed the I2C device addressing capabilities.
      - Isolate intelligent management controllers from critical/sensitive
      I2C devices.

Redfish is a standard that uses restful interface semantics to provide
access to system components for the purpose of being able to manage the
devices. Redfish uses the standard network interfaces and protocols to
provide management capabilities for the system. Prior to Redfish, Server
Management implemented the Intelligent Platform Management Interface (IPMI)
specification. Which was created in the mid-1990s, and went through several
revisions. There are several security vulnerabilities identified within the
IPMI specification that require mitigations. The Redfish standard will be
replacing the IPMI implementations.

>>> "Development board must support OpenBMC" what is the meaning of this
statement?
My thought here is that this is referring to be able to execute an OpenBMC
FW stack and provide the necessary management interfaces per the product
requirements; such as network interfaces and/or host interfaces.

Good night...
James.

On Wed, Feb 17, 2021 at 10:05 PM Daniel <sd2@maxvytech.com> wrote:

> Hi,
>
> I am new to OpenBMC or even BMC concept. Since a project requirement has
> come related to this concept , i want to learn about this concept. I am an
> embedded software developer.
>
> Is OpenBMC an OS? somewhere i noticed that it will generate an image file
> to a target machine.
>
> What are the prerequisites that a target BMC should have?
>
> and please explain the following as well,
>
> *Can we install in an FPGA board? if yes, what is the hardware requirement
> to install this OpenBMC?
>
> *How redfish is used in OpenBMC?
>
> *I would like to get some clarification in this concept.
>
> *"Development board must support OpenBMC" what is the meaning of this
> statement?
>
>
>
> Thank you,
>
>
>
>
> Regards,
> Daniel Kirubakaran S
> Embedded SW Developer
> Maxvy Technologies Pvt Ltd
> Bangalore
>
>
>

--00000000000095b4ca05bb98d0dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Daniel,=C2=A0<div><br></div><div>We=
lcome to the project. I&#39;ll try to answer your=C2=A0questions, and I&#39=
;m sure others will contribute as well.</div><div><br></div><div>The OpenBM=
C Firmware stack is a Linux distribution that can be thought of as a toolki=
t for creating a firmware image that boots the Linux OS and contains numero=
us drivers and applications targeted for a specialized PSoC known as the Ba=
seboard Management Controller (BMC). The OpenBMC project uses the Yocto pro=
ject (<a href=3D"http://www.yoctoproject.org">www.yoctoproject.org</a>) whi=
ch uses Openembedded (<a href=3D"http://www.openembedded.org">www.openembed=
ded.org</a>) as the=20



build automation framework

 to build the Linux distribution.=C2=A0</div></div><div><br></div><div>Ther=
e&#39;s not a simple answer to the question of what prerequisites a target =
BMC should have. It all depends upon your use cases and requirements. Most =
high-end servers contain the PSoC version of a BMC (e.g., ASpeed AST2500/26=
00 or Nuvoton NPCM7xx/NPCM8xx). Which have three functional component block=
s consisting of what was referred to as the southbridge in the Intel Archit=
ecture

(i.e., USB, keyboard controllers, UARTs, PCIe, SPI, network, ACPI, etc...),=
 a video graphics controller, and then the management controller itself. If=
 you don&#39;t need the video controller or southbridge, there are other co=
ntrollers available. The key question is to determine what your requirement=
s are and to look for a controller that is already supported in the Linux k=
ernel. ASpeed and Nuvoton also make lower cost and simpler BMCs.</div><div>=
<br></div><div>Can you install a BMC on an FPGA board?=C2=A0=C2=A0</div><di=
v>Yes, but the hardware requirements are dependent upon your use cases and =
the controller you choose.=C2=A0</div><div>Here are some basic hardware req=
uirements off the top of my head. I&#39;m sure I&#39;ll think of more after=
 I send this email.</div><div><ul><li>Power the BMC on standby power - sepa=
rate from the income-producing payload</li><li>Have a well defined power-on=
-reset sequence for BMC and downstream devices</li><li>Perform a threat mod=
el of your design and provide mitigations to the threats that can be exploi=
ted to cause a DOS or PDOS of the product.</li><li>Provide hardware to allo=
w programming of the memory device while in-circuit (e.g., SPI flash or eMM=
C).</li><ul><li>Isolate the power plane to the flash memory device(s) from =
the power plane connection to the BMC and other devices. This is needed to =
prevent the programmer from sourcing power to the entire board when program=
ming the memory device while in-circuit and board power is not present.</li=
></ul><li>Define your I2C bus topology so as not to create excessive traffi=
c on any bus.=C2=A0</li><ul><li>Group I2C devices according to function (i.=
e., power supplies on a dedicated PMBus)</li><ul><li>Be careful not to exce=
ed the I2C device addressing capabilities.=C2=A0</li></ul><li>Isolate intel=
ligent management controllers from critical/sensitive I2C devices.</li></ul=
></ul></div><div>Redfish is a standard that uses restful interface semantic=
s to provide access to system components for the purpose of being able to m=
anage the devices. Redfish uses the standard network interfaces and protoco=
ls to provide management capabilities for the system. Prior to Redfish, Ser=
ver Management implemented the Intelligent Platform Management Interface (I=
PMI) specification. Which was created in the mid-1990s, and went through se=
veral revisions. There are several security vulnerabilities identified with=
in the IPMI specification that require mitigations. The Redfish standard wi=
ll be replacing the IPMI implementations.</div><div><br></div><div>&gt;&gt;=
&gt; &quot;Development board must support OpenBMC&quot; what is the meaning=
 of this statement?=C2=A0<br></div><div>My thought here is that this is ref=
erring to be able to execute an OpenBMC FW stack and provide the necessary =
management interfaces per the product requirements; such as network interfa=
ces and/or host interfaces.</div><div><br></div><div>Good night...</div><di=
v>James.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Feb 17, 2021 at 10:05 PM Daniel &lt;<a href=3D"mailto:s=
d2@maxvytech.com" target=3D"_blank">sd2@maxvytech.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u><div><div style=
=3D"font-family:Verdana,Arial,Helvetica,sans-serif;font-size:10pt"><div>Hi,=
<br></div><div><br></div><div>I am new to OpenBMC or even BMC concept. Sinc=
e a project requirement has come related to this concept , i want to learn =
about this concept. I am an embedded software developer.<br></div><div><br>=
</div><div>Is OpenBMC an OS? somewhere i noticed that it will generate an i=
mage file to a target machine.<br></div><div><br></div><div>What are the pr=
erequisites that a target BMC should have?<br></div><div><br></div><div>and=
 please explain the following as well,<br></div><div><br></div><div>*Can we=
 install in an FPGA board? if yes, what is the hardware requirement to inst=
all this OpenBMC?<br></div><div><br></div><div>*How redfish is used in Open=
BMC?<br></div><div><br></div><div>*I would like to get some clarification i=
n this concept.<br></div><div><br></div><div>*&quot;Development board must =
support OpenBMC&quot; what is the meaning of this statement?<br></div><div>=
<br></div><div><br></div><div><br></div><div>Thank you,<br></div><div><br><=
/div><div><br></div><div><br></div><div><br></div><div id=3D"m_297485365562=
1730178gmail-m_-2656179981923976788"><div>Regards,<br></div><div>Daniel Kir=
ubakaran S<br></div><div>Embedded SW Developer<br></div><div>Maxvy Technolo=
gies Pvt Ltd<br></div><div>Bangalore<br></div></div><div><br></div></div><b=
r></div></blockquote></div></div>

--00000000000095b4ca05bb98d0dc--
