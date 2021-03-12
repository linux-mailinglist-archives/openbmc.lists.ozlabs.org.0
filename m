Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD4338656
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 08:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxcKb41rQz3cVW
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 18:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OPpFuDrD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OPpFuDrD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxcKL1cXfz3cG2
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 18:05:41 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C74EFa190189; Fri, 12 Mar 2021 02:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=qOkhosEoEgYcjpxh1CjQRReDaKC/6ulWlR9Vmr5GCY8=;
 b=OPpFuDrDB6Z0jIeYH/+7/xvecscuSyl2WAB4njh3UKUso/hVd1spLik32BM/SIrYP0ry
 nb9Soa7h+dzPHboV6wxZUQDTPKvP1WOCMte62+0dbm/A5vorLYIa0B3eUibtodMg4rR9
 xLtQDTVEmCkFt0rEvWi+O1X/zlMgCT4YElO/FIxD6HHDp+S/s7pRpfzM0o3xqA9ul7bj
 srTlpzD+VBitULB08dcJ87pUvwFJ3i/7SMALYClxH+Xu0ntMttZdYChrSO9NteoLr+id
 7GnhwGyZbB4MJMkz0WLDxGSMpGjrTqlmdFkRGlvnRBarG8ZjtZ8Acp+VH9sYpmc6LQBR rA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774m4e932-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 02:05:37 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12C6m9jU006387;
 Fri, 12 Mar 2021 07:05:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3768n61cs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 07:05:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12C75Gg835062134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Mar 2021 07:05:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E4AD4203F;
 Fri, 12 Mar 2021 07:05:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECB042042;
 Fri, 12 Mar 2021 07:05:31 +0000 (GMT)
Received: from [9.199.45.202] (unknown [9.199.45.202])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Mar 2021 07:05:31 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
X-Apple-Base-Url: x-msg://3/
In-Reply-To: <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
X-Apple-Windows-Friendly: 1
Date: Fri, 12 Mar 2021 12:35:22 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
 <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_02:2021-03-10,
 2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120044
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
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;"><br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">On 12-Mar-2021, at 6:00 AM, Joel Stanley &lt;<a =
href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt; =
wrote:<br class=3D""><br class=3D"">On Fri, 12 Mar 2021 at 00:21, Milton =
Miller II &lt;<a href=3D"mailto:miltonm@us.ibm.com" =
class=3D"">miltonm@us.ibm.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D""><br class=3D""><br =
class=3D"">-----"openbmc" &lt;<a =
href=3D"mailto:openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org" =
class=3D"">openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org</a>&gt; =
wrote: -----<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">To: Eddie James &lt;<a href=3D"mailto:eajames@linux.ibm.com" =
class=3D"">eajames@linux.ibm.com</a>&gt;<br class=3D"">From: Joel =
Stanley<br class=3D"">Sent by: "openbmc"<br class=3D"">Date: 03/11/2021 =
06:09PM<br class=3D"">Cc: OpenBMC Maillist &lt;<a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a>&gt;<br class=3D"">Subject: =
[EXTERNAL] Re: [PATCH linux dev-5.10 06/35] ARM: dts:<br =
class=3D"">aspeed: rainier: Add leds that are off PCA9552<br =
class=3D""><br class=3D"">On Mon, 8 Mar 2021 at 22:54, Eddie James =
&lt;<a href=3D"mailto:eajames@linux.ibm.com" =
class=3D"">eajames@linux.ibm.com</a>&gt;<br class=3D"">wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">From: =
Vishwanatha Subbanna &lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com" =
class=3D"">vishwa@linux.vnet.ibm.com</a>&gt;<br class=3D""><br =
class=3D"">These LEDs are on the fans and are connected via a<br =
class=3D"">pca9551 i2c expander<br class=3D""></blockquote><br =
class=3D"">This change doesn't make sense. The pca9551 is an i2c LED =
expander,<br class=3D"">so<br class=3D"">we don't need to expose the =
pins as GPIOs and then attach a gpio-leds<br class=3D"">driver to them. =
We should instead simply configure the pca955x driver<br class=3D"">to =
drive the LEDs as LEDs.<br class=3D""></blockquote><br class=3D"">I'll =
refresh your memory on why we have been doing this in our<br =
class=3D"">devie trees and then let you consider if this is desired or =
not.<br class=3D""><br class=3D"">The led system insistes on creating a =
compact map (no holes) (as<br class=3D"">does the reset subsystem).<br =
class=3D""><br class=3D"">However, this means the relative led number =
for a pin changes<br class=3D"">as the prior pins change from gpio to =
led configuration.<br class=3D""><br class=3D"">For example if pins 2 =
and 7 are leds, they become leds 0 and 1.<br class=3D"">Changing pin 5 =
to also be an led means that pin 7 is now led 2<br class=3D"">not led 1 =
on the led subsystem.<br class=3D""></blockquote><br class=3D"">Thanks =
for the rationale reminder.<br class=3D""><br class=3D"">Are these led =
numbers important to userspace, or does the renumbering<br =
class=3D"">affect device tree changes only?<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div>Here are my technical needs.<div =
class=3D"">- I need these LEDs associated with names and this __must =
not__ change</div><div class=3D"">- I need those LEDs represented as =
`/sys/class/leds/&lt;$name&gt;`</div><div class=3D""><br =
class=3D""></div><div class=3D"">What can I do :</div><div class=3D"">- =
use `leds-gpio` like how it=E2=80=99s done today</div><div class=3D""><br =
class=3D""></div><div class=3D"">OR</div><div class=3D""><br =
class=3D""></div><div class=3D"">- Use =E2=80=9Clabel=E2=80=9D in =
PCA955X_TYPE_LED</div><div class=3D"">&nbsp; &nbsp;- However, putting =
this label, it results in `/sys/class/leds/pca955x:&lt;$label&gt;`. As =
opposed to `/sys/class/leds/&lt;$label&gt;`.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Is there a way where I can get =
`/sys/class/leds/&lt;$label&gt;` ?. I did not get this from the =
documentation. Seeing pca955x on 100 entries seems a noise</div><div =
class=3D""><br class=3D""></div><div class=3D"">!! Vishwa =
!!&nbsp;</div></div></body></html>=
