Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD1B163D19
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 07:38:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Mp344DSvzDqlX
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 17:38:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Mp2T6JlZzDqWJ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 17:38:24 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01J6b7ko080997
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 01:38:22 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8uckf3me-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 01:38:21 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 19 Feb 2020 06:38:18 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Feb 2020 06:38:15 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01J6cEJR58589226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Feb 2020 06:38:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD81AA405F;
 Wed, 19 Feb 2020 06:38:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 237BFA405C;
 Wed, 19 Feb 2020 06:38:14 +0000 (GMT)
Received: from [9.109.160.230] (unknown [9.109.160.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Feb 2020 06:38:13 +0000 (GMT)
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: NO
X-Apple-Base-Url: x-msg://9/
In-Reply-To: <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
X-Apple-Windows-Friendly: 1
Date: Wed, 19 Feb 2020 12:07:06 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TM-AS-GCONF: 00
x-cbid: 20021906-0016-0000-0000-000002E82935
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021906-0017-0000-0000-0000334B400B
Message-Id: <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_01:2020-02-18,
 2020-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 suspectscore=1 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002190048
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div class=3D"ApplePlainTextBody">Thanks =
for the good discussion on this.<br><br>Patrick, I see you mentioned the =
TimeOwner in your response. TimeOwner was another thing that was =
disliked by the users and I had sent an email couple months ago asking =
if anyone still needs it. I did not see anyone saying they need. I then =
proposed removing TimeOwner feature. <br><br>So, if we want to make it =
simpler, we would want to:<br><br>- Remove TimeOwner concept<br>- Remove =
the deferred updates to Manual / NTP settings.<br><br>Please let me know =
if you see anything that might be affected by this =
?.<br><br>Thanks,<br>!! Vishwa !!<br><br><blockquote type=3D"cite">On =
19-Feb-2020, at 3:21 AM, Patrick Williams &lt;patrick@stwcx.xyz&gt; =
wrote:<br><br>On Tue, Feb 18, 2020 at 04:01:00PM -0500, Brad Bishop =
wrote:<br><blockquote type=3D"cite"><br><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">Please =
could you help with your thoughts on this ?.. What is the Industry norm =
on this ?<br></blockquote><br>FWIW on our (IBM) system designs we =
usually hook an RTC up to the BMC, and any host software needing a RTC =
has to get it via some in-band software interface. &nbsp;I think I heard =
somewhere though that often in other systems designs the RTC is =
connected to the host processors and the BMC doesn=E2=80=99t have access =
to it.<br></blockquote><br>FB's OCP designs all have the RTC to the =
Host, so I'm not sure any of<br>this is applicable to =
us.<br></blockquote><br>Are there any down sides to designs like this? =
&nbsp;I guess if NTP is not an option on the BMC, you are at the mercy =
of the host firmware if you want correct time. &nbsp;If NTP is in use on =
the BMC does an RTC still do anything for you?<br></blockquote><br>There =
are times that the BMC doesn't know what time it is and reverts<br>back =
to 1970. &nbsp;At least until the network and NTP are up again. =
&nbsp;I'm not <br>sure the history at why we arrived at this design, =
honestly.<br><br>-- <br>Patrick =
Williams<br></blockquote><br></div></body></html>=

