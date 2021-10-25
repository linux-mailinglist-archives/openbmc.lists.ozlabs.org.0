Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105A43A443
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 22:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdR8M6BvHz2yKN
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 07:17:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdlM/PWB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YdlM/PWB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdR7v4nmqz2xXR
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 07:17:14 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PINo19020035; 
 Mon, 25 Oct 2021 20:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=5kgOGxP0GUoAse/Whb/GHvlbkXCEGTWPZpZfLuVXa1E=;
 b=YdlM/PWBOlfbEEiozaTiv0TYndr7F/rRhxXuiXB58bRrVFC8YGXHfvPx4sFB9Ae5EKKN
 SkWlVdi1G2XR2DWJ0yr1K0RH+WGptNCycjUh4UDHQrJTn4n4QKSIc1dLvtL6y5Zi43JC
 ndF++E+EQmVFGPgenC+mLhRADWISRinTtvUFxKtyIaCpG4J/s8VMZWJhH6kgiq+lPPAd
 OPdaN4wDuxWNZALp4f6A/roo/JKTkycN+oiBfQuNMs6ILtv5cutwrZ9QnP5lDX95NSUI
 LEmlkYlzwY6duDLbiuNIfndYilrMKal3a9HbzcXKRjrt/5MOPXEF16NP7i5pEZxty2gX iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx1ggumr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 20:17:10 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19PIPCtW024343;
 Mon, 25 Oct 2021 20:17:10 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx1ggumqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 20:17:10 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19PK93hu013789;
 Mon, 25 Oct 2021 20:17:09 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3bva1ax337-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 20:17:09 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19PKH8W514614914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 20:17:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49C1EB205F;
 Mon, 25 Oct 2021 20:17:08 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF15AB2066;
 Mon, 25 Oct 2021 20:17:07 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.65.206.111])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Oct 2021 20:17:07 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <80FD1EF5-EA89-4FE1-8075-B07E9122FF8E@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_B48FD13D-79FB-4657-A8DA-539A30F1E2EC"
Subject: Re: [External] Changing the os-release BUILD_ID back to its default
 value of DATETIME
Date: Mon, 25 Oct 2021 15:17:06 -0500
In-Reply-To: <CAPnigKnnvoiQyroWRyFc4Ps+AZ4XNyr5VsmuDwCOh=2YvHEE0g@mail.gmail.com>
To: William Kennington <wak@google.com>, edtanous@google.com,
 =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
References: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
 <CAGm54UF4nADhYJPWjgr-ie3z2vGzW6aBvdsyQpJ4dsddgA3FLQ@mail.gmail.com>
 <CAPnigKnnvoiQyroWRyFc4Ps+AZ4XNyr5VsmuDwCOh=2YvHEE0g@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8Tu4-azosA6T6bvwvi9EuV3PogtXQeLl
X-Proofpoint-GUID: 8dIWCIcaPlThv30mltrOsypSPdtkrkN6
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_07,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=936 clxscore=1011
 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250114
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_B48FD13D-79FB-4657-A8DA-539A30F1E2EC
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks everybody. Changes up for review:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204 <https://gerri=
t.openbmc-project.xyz/c/openbmc/openbmc/+/48204>
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205 <https://gerri=
t.openbmc-project.xyz/c/openbmc/openbmc/+/48205>


> On Oct 12, 2021, at 4:45 AM, William Kennington <wak@google.com> wrote:
>=20
> Personally I would rather have deterministic builds and don't like
> arbitrary build timestamp injection into images. But we can announce
> the plan to change this behavior and adjust build processes
> accordingly.

Sounds like a plan. To keep the current behavior, I tested that adding a os=
-release.bbappend with BUILD_ID set to the current git command would build =
the image with the value as it is today.

>=20
> On Mon, Oct 11, 2021 at 10:34 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>>=20
>> On Tue, Oct 12, 2021 at 6:00 AM Adriana Kobylak <anoo@linux.ibm.com> wro=
te:
>>>=20
>>> Hi,
>>>=20
>>> There has been some discussion in Discord on how to work around the "Sa=
me version" limitation during fw updates, and having a timestamp field that=
 could be used to generate a different version id (commit id plus timestamp=
 field) for every build seemed had positive support in the discussion.
>>=20
>> So the hash will be calculated as the `VERSION_ID` and `BUILD_ID` (as
>> timestamp), is it?
>> +1 for this proposal.

Right, we=E2=80=99ll add BUILD_ID to the hash calculation.

>>=20
>> --
>> BRs,
>> Lei YU


--Apple-Mail=_B48FD13D-79FB-4657-A8DA-539A30F1E2EC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Thanks everybody. Changes up for review:<div class=3D""><br =
class=3D""></div><div class=3D""><a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204" =
class=3D"">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204</a=
></div><div class=3D""><a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205" =
class=3D"">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205</a=
></div><div class=3D""><br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Oct 12, 2021, at 4:45 AM, =
William Kennington &lt;<a href=3D"mailto:wak@google.com" =
class=3D"">wak@google.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Personally I would rather have deterministic builds and don't =
like<br class=3D"">arbitrary build timestamp injection into images. But =
we can announce<br class=3D"">the plan to change this behavior and =
adjust build processes<br class=3D"">accordingly.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Sounds =
like a plan. To keep the current behavior, I tested that adding a =
os-release.bbappend with BUILD_ID set to the current git command would =
build the image with the value as it is today.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D""><br class=3D"">On Mon, Oct 11, 2021 at 10:34 PM Lei Yu &lt;<a =
href=3D"mailto:yulei.sh@bytedance.com" =
class=3D"">yulei.sh@bytedance.com</a>&gt; wrote:<br class=3D""><blockquote=
 type=3D"cite" class=3D""><br class=3D"">On Tue, Oct 12, 2021 at 6:00 AM =
Adriana Kobylak &lt;<a href=3D"mailto:anoo@linux.ibm.com" =
class=3D"">anoo@linux.ibm.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D"">Hi,<br class=3D""><br =
class=3D"">There has been some discussion in Discord on how to work =
around the "Same version" limitation during fw updates, and having a =
timestamp field that could be used to generate a different version id =
(commit id plus timestamp field) for every build seemed had positive =
support in the discussion.<br class=3D""></blockquote><br class=3D"">So =
the hash will be calculated as the `VERSION_ID` and `BUILD_ID` (as<br =
class=3D"">timestamp), is it?<br class=3D"">+1 for this proposal.<br =
class=3D""></blockquote></div></div></blockquote><div><br =
class=3D""></div>Right, we=E2=80=99ll add BUILD_ID to the hash =
calculation.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D"">--<br class=3D"">BRs,<br class=3D"">Lei YU<br =
class=3D""></blockquote></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_B48FD13D-79FB-4657-A8DA-539A30F1E2EC--

