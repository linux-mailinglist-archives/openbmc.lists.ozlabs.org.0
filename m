Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F96276530
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 02:35:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxbgX4xf0zDqBV
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 10:35:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=apple.com (client-ip=17.171.2.68;
 helo=ma1-aaemail-dr-lapp02.apple.com; envelope-from=cyang999@apple.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=apple.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=apple.com header.i=@apple.com header.a=rsa-sha256
 header.s=20180706 header.b=iD7JIFgr; dkim-atps=neutral
Received: from ma1-aaemail-dr-lapp02.apple.com
 (ma1-aaemail-dr-lapp02.apple.com [17.171.2.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxbfc5f9HzDqB3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 10:35:04 +1000 (AEST)
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 08O0XWKJ006813; Wed, 23 Sep 2020 17:35:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=ddapmJehNJzjq/UbKEwlMT2n9AXTmZRr15PdKEfAbd0=;
 b=iD7JIFgrhpdaG5jKb6vxpX6pAZ2GDPZLGLinDO+Y8Akc9nK8kuQH5LiOL7VliNSx/6TJ
 w5+vTlsz0Xp/RWrqxY0Uch2k1faFp1DU955i56gJXiprQ98JQ8DvEYFSgMZc2y0lnMyh
 HZYc7vRyFTNMRmK3Fx4Vh7/Be0iVNAymb2sSsUrAHBHQtWWSkHFA4z9jxQ+pTfUBMQ+x
 pglxJ3GzjgJ2VMrmjtJdcD882tBB+SlyRHFXEYEJ6HdgAyRMx/UhgZ09EDugnxj0faMa
 Fi028wmWVLYN0z/4CadeT7lJZO/F9JoRlOmZ4g9K6YUP4CXbe8CUKqntOHuSCJZX42PT 8A== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 33nent49sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 23 Sep 2020 17:35:00 -0700
Received: from rn-mailsvcp-mmp-lapp03.rno.apple.com
 (rn-mailsvcp-mmp-lapp03.rno.apple.com [17.179.253.16])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) with ESMTPS id <0QH5003MA0AB1MR0@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Wed, 23 Sep 2020 17:34:59 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp03.rno.apple.com by
 rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) id <0QH500R00079OF00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Wed,
 23 Sep 2020 17:34:59 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 52471ebc1ff85ed47608efb744b483da
X-Va-E-CD: 9f0ac0506bfbbd3a98cbe06d5bcbf383
X-Va-R-CD: ba0899e27aebf5adb0b2c3182f537d00
X-Va-CD: 0
X-Va-ID: 0582c912-0553-42c4-9cee-b23310de93ca
X-V-A: 
X-V-T-CD: 52471ebc1ff85ed47608efb744b483da
X-V-E-CD: 9f0ac0506bfbbd3a98cbe06d5bcbf383
X-V-R-CD: ba0899e27aebf5adb0b2c3182f537d00
X-V-CD: 0
X-V-ID: 5031457c-77ca-4701-b69f-2ae4ef8ddc1a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_19:2020-09-23,
 2020-09-23 signatures=0
Received: from [17.234.22.226] by rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020))
 with ESMTPSA id <0QH500LD70ABWR00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Wed,
 23 Sep 2020 17:34:59 -0700 (PDT)
From: Cheng Yang <cyang999@apple.com>
Message-id: <16A211E0-3906-42D6-B8DB-E8E13CDAA176@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_F76C6E2F-2C6F-4B92-BDDF-CE1CAD3873CA"
MIME-version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: Difficulty booting on Raspberry Pi 4.
Date: Wed, 23 Sep 2020 17:34:58 -0700
In-reply-to: <20200924001055.GW6152@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
References: <CDC90A55-957D-47BB-9B42-4283BB6706AF@apple.com>
 <20200924001055.GW6152@heinlein>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_19:2020-09-23,
 2020-09-23 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_F76C6E2F-2C6F-4B92-BDDF-CE1CAD3873CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Patrick and Ed,

Ed replied early and as soon as I added the line for SDImage=20
IMAGE_FSTYPES=3D"rpi-sdimg=E2=80=9D
It boots now. =20

Thanks everyone, very helpful!

Cheng


> On Sep 23, 2020, at 5:10 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Wed, Sep 23, 2020 at 10:36:03AM -0700, Cheng Yang wrote:
>> Hi,  I=E2=80=99m openbmc noob here.
>=20
> Welcome.
>=20
>> I follow the instruction of =
https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/README.md =
<https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/README.md=
>
>=20
> I don't think there are really many people using the meta-raspberrypi
> with OpenBMC.  This comes from elsewhere outside the project as one of
> the Yocto community meta-layers and isn't related to OpenBMC.
>=20
> What happened was that someone had an idea to use a rpi as an
> easily-accessible experimental platform for running OpenBMC code and
> they asked to have the meta-layer added to our tree.  We keep it in
> sync, but I don't think that experiment really went much farther.
>=20
> See https://github.com/openbmc/openbmc/issues/399 for some of the
> origin.
>=20
> If you're doing just a simple rpi4 image build, without any of the
> OpenBMC layers, and it won't even boot, that seems like something you
> could tackle with the upstream community.  The README suggests that
> the general Yocto mailing list is where to go:
>=20
> ```
> * Mailing list (yocto mailing list): <yocto@yoctoproject.org>
> ```
>=20
> --=20
> Patrick Williams


--Apple-Mail=_F76C6E2F-2C6F-4B92-BDDF-CE1CAD3873CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Patrick and Ed,<div class=3D""><br class=3D""></div><div =
class=3D"">Ed replied early and as soon as I added the line for =
SDImage&nbsp;<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">IMAGE_FSTYPES=3D"rpi-sdimg</span><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">=E2=80=9D</span></font><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">It =
boots now. &nbsp;</span></font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">Thanks everyone, very helpful!</span></font></div><div =
class=3D""><font color=3D"#000000" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0);" class=3D""><br class=3D""></span></font></div><div =
class=3D""><font color=3D"#000000" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0);" class=3D"">Cheng</span></font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font><div><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Sep 23, 2020, at 5:10 PM, Patrick Williams =
&lt;<a href=3D"mailto:patrick@stwcx.xyz" =
class=3D"">patrick@stwcx.xyz</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Wed, Sep 23, 2020 at 10:36:03AM -0700, Cheng Yang wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Hi, &nbsp;I=E2=80=99m =
openbmc noob here.<br class=3D""></blockquote><br class=3D"">Welcome.<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">I follow =
the instruction of <a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/RE=
ADME.md" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi=
/README.md</a> &lt;<a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/RE=
ADME.md" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi=
/README.md</a>&gt;<br class=3D""></blockquote><br class=3D"">I don't =
think there are really many people using the meta-raspberrypi<br =
class=3D"">with OpenBMC. &nbsp;This comes from elsewhere outside the =
project as one of<br class=3D"">the Yocto community meta-layers and =
isn't related to OpenBMC.<br class=3D""><br class=3D"">What happened was =
that someone had an idea to use a rpi as an<br =
class=3D"">easily-accessible experimental platform for running OpenBMC =
code and<br class=3D"">they asked to have the meta-layer added to our =
tree. &nbsp;We keep it in<br class=3D"">sync, but I don't think that =
experiment really went much farther.<br class=3D""><br class=3D"">See <a =
href=3D"https://github.com/openbmc/openbmc/issues/399" =
class=3D"">https://github.com/openbmc/openbmc/issues/399</a> for some of =
the<br class=3D"">origin.<br class=3D""><br class=3D"">If you're doing =
just a simple rpi4 image build, without any of the<br class=3D"">OpenBMC =
layers, and it won't even boot, that seems like something you<br =
class=3D"">could tackle with the upstream community. &nbsp;The README =
suggests that<br class=3D"">the general Yocto mailing list is where to =
go:<br class=3D""><br class=3D"">```<br class=3D"">* Mailing list (yocto =
mailing list): &lt;<a href=3D"mailto:yocto@yoctoproject.org" =
class=3D"">yocto@yoctoproject.org</a>&gt;<br class=3D"">```<br =
class=3D""><br class=3D"">-- <br class=3D"">Patrick Williams<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></div></body></html>=

--Apple-Mail=_F76C6E2F-2C6F-4B92-BDDF-CE1CAD3873CA--
