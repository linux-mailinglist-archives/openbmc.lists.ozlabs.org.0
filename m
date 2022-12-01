Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8B641AAB
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 05:16:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NPtfP71cbz3bfM
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 15:16:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PFP5qvrO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=amirradh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PFP5qvrO;
	dkim-atps=neutral
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNNM63XFsz3bPL
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 04:28:00 +1100 (AEDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-12c8312131fso2919822fac.4
        for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2022 09:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7FPPR1mI1G9Avl6swQGnYgPTxNPRT3xU7mh2W17znpk=;
        b=PFP5qvrOiJNQrvMiyvAOgvjN1m4QvEGUVbnd1cUUnwWRpv7ahJ8pARsProtlfwfm2V
         c/T8BqDjuNMfIolJr9jCRoYrwK/1ycgDV8C4UTg3Cz4Kq6duL7O8VNEHmpbTyjHS2C2r
         h492LdjHsnVZTXGGAkBlcmbBQumS2UfXj8XlZj0CfGbdnCouTlazIN2NXdyEhN0Gaw5J
         QW/qxWZRwP5qnkQFMRSFJGZXI5jYLKihLr0HP8zk2fGh5EzBzUZudMQ9OdGqUWNSzYdW
         /A+TXdaOxf4l2aa9VBVvZVNx4e896uCE87ZzkP5KrsGgWCA684oiZa61MAXNq1IsD7Ao
         ykIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FPPR1mI1G9Avl6swQGnYgPTxNPRT3xU7mh2W17znpk=;
        b=17hMJE8uvV3xhRAsAw9H2hDaMci54OZ0lzrRwzu9GsS3glywgPXewZUgeK425tQp9K
         IjhPgMFg4M9YXgJSFOGv1NOsdP430a4pfr99Q8xkDbk+5Rt9vawAgqQ7bGOXWM7toi2e
         lxuMv6NIVOmBPJmqTcSGdzXh42d+tFzv/w9gDRl+wyy3rK6Uh7VwBku2VUn8BZzxqVW9
         s23LCsMOznRhp9pKK13D2/XEZe6T8/bC9HbUxqqMUR2MlW1jO14NuWwHf7XrvWT+eWrt
         RqgRBucG6X9PFnZTU4R1mfzVjbUetVMf5i64LGuH8PHZfye2Dqwtf/HaLhinMkxVmMP/
         c+ug==
X-Gm-Message-State: ANoB5plIQvIfDmnCGgqj4Zn3+NdPxde7qKlFhfrMLUe20BD1KLHTw3/A
	ovwalcfs63wTRps7vIxCJHqANa5mFaMXOT361my1heSanJ8=
X-Google-Smtp-Source: AA0mqf6xI0m3eqDescELeKLqNroYrjWmnPmum/du0NH4K0PMbQXBOhuWuwftOBUEKPc9WJdbrDjJwqw1ILZDYjThzno=
X-Received: by 2002:a05:6870:ac94:b0:142:d317:2bd0 with SMTP id
 ns20-20020a056870ac9400b00142d3172bd0mr32122212oab.80.1669915676243; Thu, 01
 Dec 2022 09:27:56 -0800 (PST)
MIME-Version: 1.0
From: Hamid Amirrad <amirradh@gmail.com>
Date: Thu, 1 Dec 2022 12:27:44 -0500
Message-ID: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
Subject: Changing ethernet port speed
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000affb4605eec78a53"
X-Mailman-Approved-At: Sun, 04 Dec 2022 15:16:00 +1100
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

--000000000000affb4605eec78a53
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to change the Ethernet port speed from 10Mbps to 1Gbps, but I
can't find a way to do that. Can you please point me in the right direction?

Thanks,
Hamid


ast# version
U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
GNU ld (GNU Binutils) 2.37.20210721

ast# printenv
SN=8513060012
baudrate=115200
bootargs=console=ttyS4,115200n8 root=/dev/ram rw
bootcmd=bootm 20080000
bootdelay=2
ethact=FTGMAC100#0
ethaddr=00:02:C5:38:1D:DF
ethaddr1=00:02:C5:38:1D:E0
ipaddr=172.16.141.104
spi_dma=yes
stderr=serial
stdin=serial
stdout=serial
verify=yes

ast# ping 172.16.141.1
FTGMAC100#0: link up, *10Mbps half-duplex*
Using FTGMAC100#0 device

ARP Retry count exceeded; starting again
ping failed; host 172.16.141.1 is not alive

--000000000000affb4605eec78a53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to change the Ethernet =
port speed from 10Mbps to 1Gbps, but I can&#39;t find a way to do that. Can=
 you please point me in the right direction?</div><div><br></div><div>Thank=
s,</div><div>Hamid</div><div><br></div><div><br></div><div>ast# version<br>=
U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)<br>arm-openbmc-linux-gnueabi-=
gcc (GCC) 11.2.0<br>GNU ld (GNU Binutils) 2.37.20210721<br></div><div><br><=
/div><div>ast# printenv<br>SN=3D8513060012<br>baudrate=3D115200<br>bootargs=
=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw<br>bootcmd=3Dbootm 20080000<=
br>bootdelay=3D2<br>ethact=3DFTGMAC100#0<br>ethaddr=3D00:02:C5:38:1D:DF<br>=
ethaddr1=3D00:02:C5:38:1D:E0</div><div>ipaddr=3D172.16.141.104<br>spi_dma=
=3Dyes<br>stderr=3Dserial<br>stdin=3Dserial<br>stdout=3Dserial<br>verify=3D=
yes<br></div><div><br></div><div>ast# ping 172.16.141.1<br>FTGMAC100#0: lin=
k up, <b><font color=3D"#ff0000">10Mbps half-duplex</font></b><br>Using FTG=
MAC100#0 device<br><br>ARP Retry count exceeded; starting again<br>ping fai=
led; host 172.16.141.1 is not alive<br></div></div>

--000000000000affb4605eec78a53--
