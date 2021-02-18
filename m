Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3190831E61C
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 07:04:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh41N2FMYz30LD
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 17:04:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=maxvytech.com header.i=sd2@maxvytech.com header.a=rsa-sha256 header.s=zoho header.b=f0R2fm6l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=maxvytech.com (client-ip=136.143.188.52;
 helo=sender4-of-o52.zoho.com; envelope-from=sd2@maxvytech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=maxvytech.com header.i=sd2@maxvytech.com
 header.a=rsa-sha256 header.s=zoho header.b=f0R2fm6l; 
 dkim-atps=neutral
X-Greylist: delayed 906 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 17:04:43 AEDT
Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com
 [136.143.188.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh4175kkRz30Hm
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 17:04:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1613627371; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RiEbzC8gTUEic8YeNvQNGacPcoAwcs6Qpc5hyAGlETEsNOsw1SSFFebZn0wpY/K8kJ0yhUqKz5cvxtzpBqF2DFFgsKCiMuozQRWBKn1eVEBgC9KezFRTdGMn4DfOI0hEbzVSK4x4momaSlyWRXqWusJRvg1rB84QXFBXi+b9+G0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; 
 t=1613627371; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=f5Va9v8mZAezP500OvUrlny9zqgTxdeLVe8/fJdSkxw=; 
 b=VZiipKPGJjTb7rgUjY4dTCllOGi9stGNOkkFqub+xg/xm2gAT4357iqM0Px9FLSrWpGHr+9oSigVksKTl+vv2TzzUBlMlsPenB5leqVV8uUkKsZjWNSjlro+ImIjlyGqqzomePVn37x6L5s2Cqrm5I96OYskd5dZAkiWA290y0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=maxvytech.com;
 spf=pass  smtp.mailfrom=sd2@maxvytech.com;
 dmarc=pass header.from=<sd2@maxvytech.com> header.from=<sd2@maxvytech.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1613627371; 
 s=zoho; d=maxvytech.com; i=sd2@maxvytech.com;
 h=Date:From:To:Message-Id:In-Reply-To:Subject:MIME-Version:Content-Type;
 bh=f5Va9v8mZAezP500OvUrlny9zqgTxdeLVe8/fJdSkxw=;
 b=f0R2fm6l9Fedk/xdtDjWYH7mMU1o99lMYwf2BZkO/dIi+9b0dttOkzwHats1lcHo
 AuuBI86d9+rQMxuuvdZcAZPTElifhg9d8dpiTAiU/sNQXXw1cTAchKq68+GQIlewsES
 N+McQciuCBajY3lH19TFzMyElw7VxHlWBJsgFbTI=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1613627365134459.3240024686096;
 Wed, 17 Feb 2021 21:49:25 -0800 (PST)
Date: Thu, 18 Feb 2021 11:19:25 +0530
From: Daniel <sd2@maxvytech.com>
To: "openbmc" <openbmc@lists.ozlabs.org>
Message-Id: <177b3af96fa.eaf65e85615103.194541248329848746@maxvytech.com>
In-Reply-To: 
Subject: What is OpenBMC ?
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_1987163_317668170.1613627365114"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

------=_Part_1987163_317668170.1613627365114
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,



I am new to OpenBMC or even BMC concept. Since a project requirement has come related to this concept , i want to learn about this concept. I am an embedded software developer.



Is OpenBMC an OS? somewhere i noticed that it will generate an image file to a target machine.



What are the prerequisites that a target BMC should have?



and please explain the following as well,



*Can we install in an FPGA board? if yes, what is the hardware requirement to install this OpenBMC?



*How redfish is used in OpenBMC?



*I would like to get some clarification in this concept.



*"Development board must support OpenBMC" what is the meaning of this statement?







Thank you,









Regards,

Daniel Kirubakaran S

Embedded SW Developer

Maxvy Technologies Pvt Ltd

Bangalore
------=_Part_1987163_317668170.1613627365114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi,<br></div><div><br></div><div>I am new to OpenB=
MC or even BMC concept. Since a project requirement has come related to thi=
s concept , i want to learn about this concept. I am an embedded software d=
eveloper.<br></div><div><br></div><div>Is OpenBMC an OS? somewhere i notice=
d that it will generate an image file to a target machine.<br></div><div><b=
r></div><div>What are the prerequisites that a target BMC should have?<br><=
/div><div><br></div><div>and please explain the following as well,<br></div=
><div><br></div><div>*Can we install in an FPGA board? if yes, what is the =
hardware requirement to install this OpenBMC?<br></div><div><br></div><div>=
*How redfish is used in OpenBMC?<br></div><div><br></div><div>*I would like=
 to get some clarification in this concept.<br></div><div><br></div><div>*"=
Development board must support OpenBMC" what is the meaning of this stateme=
nt?<br></div><div><br></div><div><br></div><div><br></div><div>Thank you,<b=
r></div><div><br></div><div><br></div><div><br></div><div><br></div><div da=
ta-zbluepencil-ignore=3D"true" id=3D""><div>Regards,<br></div><div>Daniel K=
irubakaran S<br></div><div>Embedded SW Developer<br></div><div>Maxvy Techno=
logies Pvt Ltd<br></div><div>Bangalore<br></div></div><div><br></div></div>=
<br></body></html>
------=_Part_1987163_317668170.1613627365114--

