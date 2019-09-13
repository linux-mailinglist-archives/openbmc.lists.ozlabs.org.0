Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0AB28CC
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 01:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VWkr6pVlzF5q6
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 09:17:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41592e3fcd=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="hEB1Vv6L"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gZCK0aDV"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VWk72b89zF5pF
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 09:17:01 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8DN8rVv019917
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 16:16:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ffIaahZ/uETfNG5K77QBlPUs/ikkI4qvDNuhGl04uyo=;
 b=hEB1Vv6LKuGNr2m7z/K2K1bHeoEcoXgwKw8wxQp2wDzTle18O/RTnf6cz8y3EslM0E4a
 bepooGB+mT1LJKEHvjsL3Kv+tqNcvA0WwuqJB7v40b20LzzETnu0PObgqJJjaY/RZdo4
 u6qVzJVXpnM2a1CXgl/CO1lQrWxhjLTsnVQ= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2uytd96aa7-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 16:16:56 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 13 Sep 2019 16:16:55 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Sep 2019 16:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfD7uPzxOrv6s/4s78JxVnPqPTURBYs6KvhXCA+7KQG9BTCcPxofOilDHXUtrxdplqid28QzSgvIqVGdaSPrwMn3CCu9ST82T2PBsRbF0o8LWiYpE4xfzyBBPjKjkPuVla5oHqkbVkPjBiWTFMVUzmXo5V8VHeFFbdbBU8+ZF5xmYFskwIem8D95h51PFvEitY3Q8f7n4mfDyGiSQoqHd3TwNVVBNKdwkI7pc0m7oIP8v1Z6wspGYZSEi1wyAFg5tqToHSxrChWFDntP9iox8NuaiyshekcE0HNiRWt+35tdQ5zpFgcsAQE+3dEM+I28C/Brg3YUWyUoO7ex6dU8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffIaahZ/uETfNG5K77QBlPUs/ikkI4qvDNuhGl04uyo=;
 b=KQwnWaJgyM2CPN2UI3tMP9P/KxVPhn2Z3sKZXNkoyFUAtI2TX/3dAbC1iUH1H9RWIvEemivykp2FqL6zX1rlssaz/Y9gO7SEpAjd1uMeJPFq6Ez1pU/V1t2X76bvkByVpKT4ItdxSPlQ10/SECsVysjdRaPcj/cp3GEOxFesATgJY5N//oDrAxkOSSuA/RMtdixUK3GUkDX5nSPiBhlqHlPYsHFUwCpQPyDrll0HWBA/5DMPh120OQpfcRDzEXNGCQUExemIoeiFxxBG5x1FRno/F4/OQEEP8Lgq4fZmosFE2Ga/yErpORjIy5tgS6ifkynxNpI2fWV7iZ4USkEXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffIaahZ/uETfNG5K77QBlPUs/ikkI4qvDNuhGl04uyo=;
 b=gZCK0aDVprk6KacVZYIvj2ebkjEoBvdop7/P6p0t6MkdXSrPTuLFXV6u0bRn2QFgDrcPT9Qalcvq+8pYhdoYD7jflsVABQhGm+V1oUHMC368Z8R/Q+DN0vbQpDNaQfVElRz9R7mVkVZWh8FRz3IWJ1GDIlkwijOMFx/uX4maaYo=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1680.namprd15.prod.outlook.com (10.175.141.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Fri, 13 Sep 2019 23:16:54 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2263.021; Fri, 13 Sep 2019
 23:16:54 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Rant regarding code review issues
Thread-Topic: Rant regarding code review issues
Thread-Index: AQHVaolUoCj//7p6akimNuI0aInyPw==
Date: Fri, 13 Sep 2019 23:16:54 +0000
Message-ID: <FB97DABE-E6EC-41CF-8628-C2AD45029CED@fb.com>
References: <mailman.578.1568408052.9379.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.578.1568408052.9379.openbmc@lists.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:21e9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fca67d0b-666c-48d4-f508-08d738a07750
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1680; 
x-ms-traffictypediagnostic: MWHPR15MB1680:
x-ms-exchange-purlcount: 7
x-microsoft-antispam-prvs: <MWHPR15MB168024D8DC48BCA2FED15CB4BDB30@MWHPR15MB1680.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(396003)(376002)(366004)(51444003)(189003)(199004)(27574002)(66446008)(6306002)(6116002)(8676002)(71190400001)(8936002)(966005)(14454004)(1730700003)(6436002)(6916009)(71200400001)(478600001)(76116006)(6486002)(5640700003)(86362001)(36756003)(7736002)(305945005)(53936002)(46003)(14444005)(2906002)(66556008)(66476007)(64756008)(66946007)(53946003)(33656002)(25786009)(6512007)(53546011)(81166006)(81156014)(256004)(6506007)(5024004)(102836004)(186003)(316002)(30864003)(5660300002)(476003)(486006)(99286004)(446003)(11346002)(76176011)(2351001)(2616005)(2501003)(579004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1680;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wEqc0A/9jv4qd0C/nBkHHfoVbbOS22cMjovGhFb4MiJha4JCClX+DIZB+YZmJs+IVIdrTPRdbhOukPPKkfc/UDWFoPOYQ1YcMfVot0UjcTJtix1S9b/j1kKI9eL5XkQGiygbaVKJbuGSOZ8nyLPP6HuvqghFYP1LpQHW5YzguNDh8NzhMpyvIf7YoaHz1T3/uDpzmD+9stzzYQ0mwCbC3bCzwa8nr6Cl3cd0SR/S5eH/zxnz0iulJGOBExjUJaNNeoDj4LPnCYywPSwVmO1JFavhGnR7M2zgQOKytoQr27LDgxRpU2STegA5TwRnXso32mt6EHc0FRuRv4TbCJhZNVSrpqrZqhwkqHE//eQiGdMyhT8Td6LcP+RxrHCo5DDtQXMarIeXVrZLgtK9azj4WLD+Egatv0A+3uDu++HSFvo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B49178CC2D43AC42870476FD945A80A1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fca67d0b-666c-48d4-f508-08d738a07750
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 23:16:54.1652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNhi+TMGgKro/hwciR+4q8e9NJUHxDDYvoOiVZYGdf0RiZY43dtrpadrM21anSDdNXucRUMwHQ9LFCuj4hbPdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1680
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_10:2019-09-11,2019-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909130226
X-FB-Internal: deliver
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

Please, everyone, again my sincere apologies for upsetting anyone. I was fr=
ustrated and sought commiseration.

I will endeavor to push content that addresses my concerns; hopefully that =
will serve the community better.

I do welcome these comments and will take them to heart. This is my first v=
enture into open source IP. I think your patience will eventually be a wort=
hwhile investment.

Wilfred




> On Sep 13, 2019, at 1:54 PM, openbmc-request@lists.ozlabs.org wrote:
>=20
> Send openbmc mailing list submissions to
> 	openbmc@lists.ozlabs.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.ozlabs.org_=
listinfo_openbmc&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3D-ektT-tD9zf2rfUi=
sE63RqiDagGyhGey2hbEGa-47kc&m=3D12QUGCNeKzJaeya2socKZls_OsPkE4dQVz5ydFylcr4=
&s=3Ds2_Ear18pkauQy8F_eaQKH620jl0g6IUzDXnSUrXyzI&e=3D=20
> or, via email, send a message with subject or body 'help' to
> 	openbmc-request@lists.ozlabs.org
>=20
> You can reach the person managing the list at
> 	openbmc-owner@lists.ozlabs.org
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of openbmc digest..."
>=20
>=20
> Today's Topics:
>=20
>   1. Re: Rant regarding code review issues

> (Ed Tanous)
>   2. Re: Rant regarding code review issues (Emily Shaffer)
>   3. Re: Rant regarding code review issues (Ed Tanous)
>   4. Re: Rant regarding code review issues (Brad Bishop)
>   5. Re: Rant regarding code review issues (Johnathan Mantey)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Fri, 13 Sep 2019 12:45:25 -0700
> From: Ed Tanous <ed.tanous@intel.com>
> To: openbmc@lists.ozlabs.org
> Subject: Re: Rant regarding code review issues
> Message-ID: <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
> Content-Type: text/plain; charset=3Dutf-8
>=20
> On 9/13/19 11:52 AM, Wilfred Smith wrote:
>>=20
>> I strongly assert that there should be a formal list of commit rules. If=
 the rules were actually documented and published, one could go through the=
 checklist to ensure that the commit conforms. The result would be less tim=
e wasted by the committer and the reviewers, as well as more consistency.
>>=20
> https://github.com/openbmc/docs
>=20
>> But it sucks to have a commit booted for reasons that (a) I could not re=
asonably be expected to have known previously (because I read the documenta=
tion, of course) and(b) I may legitimately disagree with (e.g. the insanity=
 that anyone
> holds to an 80-column rule instead of 132 in a day of 4K monitors and
> 75-character class names inside nested namespaces that are just as long,
> not counting fully decorated traits). Oh?right?just use ?auto?.
>=20
>> From the coding standard here:
> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md
>=20
> "Line length should be limited to 80 characters."
>=20
> You are welcome to disagree with that statement, but the recommended way
> to go about that would be to push a review to change to that rule,
> invoking a 132 character line length, and start a discussion about the
> above.  After that, follow up with changes to the clang-format, and
> commits to each repository to change the codebase to obey the new rule.
> I'm willing to bet if you did that, many people would agree with you,
> and we'd have a very productive discussion about it.
>=20
> It should be noted, for most code, all of this formatting is automatic
> via clang-format, which is documented on the next line in the file I link=
ed.
>=20
> With all of the above, I'm struggling to see how you're wanting to
> improve here.  Do you think the documentation could be cleaned up?  Is
> the documentation too long to read?  Should we organize it in a
> different way so that the information above is easier to find?
>=20
>>=20
>> The process should be somewhat predictable, preferably programmatic.
>=20
> Agreed, but throughout this email, I don't see any actionable suggestion
> on how this could be improved.  Could you focus a little more on what
> you think we could change to make this situation better?
>=20
>>=20
>> Mind you, I have no problem with complying with the maintainer?s rules, =
but I?d like to have some chance at getting a trivial commit passed on the =
first shot. Two lines of BitBake config, that actually accomplish what is i=
ntended, fetches a half-dozen complaints?
>=20
> Assuming this is the review you're talking about:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2Dp=
roject.xyz_c_openbmc_meta-2Dfacebook_-2B_25145&d=3DDwICAg&c=3D5VD0RTtNlTh3y=
cd41b3MUw&r=3D-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=3D12QUGCNeKzJae=
ya2socKZls_OsPkE4dQVz5ydFylcr4&s=3Dx2eMFtQOCcaJ5Tq6rd6rIHLNYxxKPs72kcZyWQvx=
lvQ&e=3D=20
>=20
> It was 7 lines of bitbake config, and it followed some project practices
> that are deprecated and trying to be removed.
>=20
> Interestingly enough, I'm not able to find where we document the 50/72
> rule for commit messages, although I know some editors will enforce it
> when you do your edits.  I would've expected it to be here:
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-ch=
anges
> Maybe that's an improvement to the docs you could propose?
>=20
>>=20
>> It helps the maintainer if committers are able to self-police 98% of the=
 issues, and makes the entire process seem less hostile.
>=20
> Agreed.  I'd also mention that in some cases (like the 50/27 rule and 80
> character line lengths) the CI could give faster feedback for obvious
> things.  Is that something you'd be willing to look into automating in
> the CI?  I'm sure a lot of people would appreciate you doing so.
> There's a lot of low hanging fruit here that could be added to CI to
> make the responses seem less hostile.
>=20
>>=20
>> Also, there are too many places to put the same information. I quoted th=
e warning messages I was remedying in the patch set comments, but summarize=
d in the commit message because that seemed like the right thing to do. And=
 that got me another downvote.
>=20
> At the end of the day, the commit message is what most people are
> looking at once the commit is merged, and you put a single line that
> wasn't very descriptive.  The maintainer pointed out that you already
> had the level of detail needed, you just failed to put it in the commit
> message.  Certainly, writing this email took longer than just updating
> the commit message with more detail?
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Fri, 13 Sep 2019 13:02:07 -0700
> From: Emily Shaffer <emilyshaffer@google.com>
> To: Ed Tanous <ed.tanous@intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: Rant regarding code review issues
> Message-ID:
> 	<CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> On Fri, Sep 13, 2019 at 12:46 PM Ed Tanous <ed.tanous@intel.com> wrote:
>>=20
>> On 9/13/19 11:52 AM, Wilfred Smith wrote:
>>>=20
>>> I strongly assert that there should be a formal list of commit rules. I=
f the rules were actually documented and published, one could go through th=
e checklist to ensure that the commit conforms. The result would be less ti=
me wasted by the committer and the reviewers, as well as more consistency.
>>>=20
>> https://github.com/openbmc/docs
>>=20
>>> But it sucks to have a commit booted for reasons that (a) I could not r=
easonably be expected to have known previously (because I read the document=
ation, of course) and(b) I may legitimately disagree with (e.g. the insanit=
y that anyone
>> holds to an 80-column rule instead of 132 in a day of 4K monitors and
>> 75-character class names inside nested namespaces that are just as long,
>> not counting fully decorated traits). Oh?right?just use ?auto?.
>>=20
>> From the coding standard here:
>> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md
>>=20
>> "Line length should be limited to 80 characters."
>>=20
>> You are welcome to disagree with that statement, but the recommended way
>> to go about that would be to push a review to change to that rule,
>> invoking a 132 character line length, and start a discussion about the
>> above.  After that, follow up with changes to the clang-format, and
>> commits to each repository to change the codebase to obey the new rule.
>> I'm willing to bet if you did that, many people would agree with you,
>> and we'd have a very productive discussion about it.
>=20
> I'll point out that as I understand it, 80c line limit is an
> accessibility issue for tools like braille readers or for users who
> need to use a larger font size than you may expect.
>=20
>> Agreed.  I'd also mention that in some cases (like the 50/27 rule and 80
>> character line lengths) the CI could give faster feedback for obvious
>> things.  Is that something you'd be willing to look into automating in
>> the CI?  I'm sure a lot of people would appreciate you doing so.
>> There's a lot of low hanging fruit here that could be added to CI to
>> make the responses seem less hostile.
>>>=20
>> It should be noted, for most code, all of this formatting is automatic
>> via clang-format, which is documented on the next line in the file I lin=
ked.
>>=20
>> With all of the above, I'm struggling to see how you're wanting to
>> improve here.  Do you think the documentation could be cleaned up?  Is
>> the documentation too long to read?  Should we organize it in a
>> different way so that the information above is easier to find?
>>=20
>>>=20
>>> The process should be somewhat predictable, preferably programmatic.
>>=20
>> Agreed, but throughout this email, I don't see any actionable suggestion
>> on how this could be improved.  Could you focus a little more on what
>> you think we could change to make this situation better?
>>=20
>>>=20
>>> Mind you, I have no problem with complying with the maintainer?s rules,=
 but I?d like to have some chance at getting a trivial commit passed on the=
 first shot. Two lines of BitBake config, that actually accomplish what is =
intended, fetches a half-dozen complaints?
>=20
> I don't want to be a killjoy here, but I think that's an overly
> ambitious goal. I see very, very few code reviews pass with no
> complaints on the first try - in this project and in other open source
> projects in the wild. I think you may need to dial back your
> expectations a little on that front. A more reasonable goal may be
> "nit comments only", for example.
>=20
>>=20
>> Assuming this is the review you're talking about:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2D=
project.xyz_c_openbmc_meta-2Dfacebook_-2B_25145&d=3DDwICAg&c=3D5VD0RTtNlTh3=
ycd41b3MUw&r=3D-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=3D12QUGCNeKzJa=
eya2socKZls_OsPkE4dQVz5ydFylcr4&s=3Dx2eMFtQOCcaJ5Tq6rd6rIHLNYxxKPs72kcZyWQv=
xlvQ&e=3D=20
>>=20
>> It was 7 lines of bitbake config, and it followed some project practices
>> that are deprecated and trying to be removed.
>>=20
>> Interestingly enough, I'm not able to find where we document the 50/72
>> rule for commit messages, although I know some editors will enforce it
>> when you do your edits.  I would've expected it to be here:
>> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-c=
hanges
>> Maybe that's an improvement to the docs you could propose?
>>=20
>>>=20
>>> It helps the maintainer if committers are able to self-police 98% of th=
e issues, and makes the entire process seem less hostile.
>>=20
>>>=20
>>> Also, there are too many places to put the same information. I quoted t=
he warning messages I was remedying in the patch set comments, but summariz=
ed in the commit message because that seemed like the right thing to do. An=
d that got me another downvote.
>>=20
>> At the end of the day, the commit message is what most people are
>> looking at once the commit is merged, and you put a single line that
>> wasn't very descriptive.  The maintainer pointed out that you already
>> had the level of detail needed, you just failed to put it in the commit
>> message.  Certainly, writing this email took longer than just updating
>> the commit message with more detail?
>=20
> I wonder about this too. In my mind, posting an update based on a code
> reviewer's comment - especially for the trivial stuff like "run
> clang-format" or "reword the commit message".  If you're finding the
> process of updating a code review with comments to involve a lot of
> overhead, please cry out for help in IRC - it doesn't have to be :) In
> fact, (putting on Git contributor hat) I'll personally volunteer to
> answer any and all Git questions you may have via email or IRC PM.
>=20
>=20
> Finally, I'd like to encourage you to think of code reviews not as
> "the maintainers are grading my work", but instead as "I am but one
> human; together we can do more."  Open source is collaborative in
> nature, and a really large part of that is code review - all patches
> in open source projects are the result of collaboration between the
> primary author and the reviewers, almost all the time. I hope you can
> see comments as "here is a thing you may not have known," rather than
> "ya big dummy!"
>=20
> - Emily
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Fri, 13 Sep 2019 13:10:05 -0700
> From: Ed Tanous <ed.tanous@intel.com>
> To: Emily Shaffer <emilyshaffer@google.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: Rant regarding code review issues
> Message-ID: <50cbafb6-6043-40fa-ef2c-2289906afecd@intel.com>
> Content-Type: text/plain; charset=3Dutf-8
>=20
> On 9/13/19 1:02 PM, Emily Shaffer wrote:
>> I'll point out that as I understand it, 80c line limit is an
>> accessibility issue for tools like braille readers or for users who
>> need to use a larger font size than you may expect.
>=20
> Neat.  I never knew that was a reasoning for 80 character widths.
>=20
> I will probably continue to complain in my own head every time I need to
> go to a few nested scopes and my line gets wrapped in an inconvenient
> place, but to a lesser extent than before now that I know there's a good
> reason for it :)
>=20
> -Ed
>=20
>=20
> ------------------------------
>=20
> Message: 4
> Date: Fri, 13 Sep 2019 16:27:47 -0400
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> To: Ed Tanous <ed.tanous@intel.com>
> Cc: Emily Shaffer <emilyshaffer@google.com>, OpenBMC Maillist
> 	<openbmc@lists.ozlabs.org>
> Subject: Re: Rant regarding code review issues
> Message-ID: <BB11D70B-19A2-467B-9C9B-98A04F33EF39@fuzziesquirrel.com>
> Content-Type: text/plain;	charset=3Dutf-8;	delsp=3Dyes;	format=3Dflowed
>=20
> at 4:10 PM, Ed Tanous <ed.tanous@intel.com> wrote:
>=20
>> On 9/13/19 1:02 PM, Emily Shaffer wrote:
>>> I'll point out that as I understand it, 80c line limit is an
>>> accessibility issue for tools like braille readers or for users who
>>> need to use a larger font size than you may expect.
>>=20
>> Neat.  I never knew that was a reasoning for 80 character widths.
>=20
> Me either?TIL...
>=20
>>=20
>> I will probably continue to complain in my own head every time I need to
>> go to a few nested scopes and my line gets wrapped in an inconvenient
>> place, but to a lesser extent than before now that I know there's a good
>> reason for it :)
>=20
> Another commonly sited reason for 80c + 8space indent? highlighting when =
=20
> you have too many levels of nested scopes :-)
>=20
>=20
> ------------------------------
>=20
> Message: 5
> Date: Fri, 13 Sep 2019 13:53:46 -0700
> From: Johnathan Mantey <johnathanx.mantey@intel.com>
> To: Emily Shaffer <emilyshaffer@google.com>, Ed Tanous
> 	<ed.tanous@intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: Rant regarding code review issues
> Message-ID: <c15e0e55-bc0f-fbeb-2250-20330a87a50a@intel.com>
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> I watched a presentation online where the presenter used long lines.? It
> was impossible to understand his content because of the long lines.? He
> was constantly scrolling left/right, effectively obfuscating the code.?
>=20
> Likewise, if you're going to cut code into a presentation slide deck it
> requires no effort to get it to fit on the slide when the line length is
> 80c non-proportional.
>=20
> I prefer 80c/line because it requires less eye motion to read.?
> It requires less hand motion, in the event you have to scroll left/right.
> It reduces the need to mentally unroll a line should you have line
> wrapping enabled, and the line exceeds your screen/display width.
> It reduces the need to mentally combine a line in the event you are
> scrolling right/left.
>=20
> Sadly C++ encourages long lines because of its verbosity.
>=20
> On 9/13/19 1:02 PM, Emily Shaffer wrote:
>> On Fri, Sep 13, 2019 at 12:46 PM Ed Tanous <ed.tanous@intel.com> wrote:
>>> On 9/13/19 11:52 AM, Wilfred Smith wrote:
>>>> I strongly assert that there should be a formal list of commit rules. =
If the rules were actually documented and published, one could go through t=
he checklist to ensure that the commit conforms. The result would be less t=
ime wasted by the committer and the reviewers, as well as more consistency.
>>>>=20
>>> https://github.com/openbmc/docs
>>>=20
>>>> But it sucks to have a commit booted for reasons that (a) I could not =
reasonably be expected to have known previously (because I read the documen=
tation, of course) and(b) I may legitimately disagree with (e.g. the insani=
ty that anyone
>>> holds to an 80-column rule instead of 132 in a day of 4K monitors and
>>> 75-character class names inside nested namespaces that are just as long=
,
>>> not counting fully decorated traits). Oh?right?just use ?auto?.
>>>=20
>>> From the coding standard here:
>>> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.m=
d
>>>=20
>>> "Line length should be limited to 80 characters."
>>>=20
>>> You are welcome to disagree with that statement, but the recommended wa=
y
>>> to go about that would be to push a review to change to that rule,
>>> invoking a 132 character line length, and start a discussion about the
>>> above.  After that, follow up with changes to the clang-format, and
>>> commits to each repository to change the codebase to obey the new rule.
>>> I'm willing to bet if you did that, many people would agree with you,
>>> and we'd have a very productive discussion about it.
>> I'll point out that as I understand it, 80c line limit is an
>> accessibility issue for tools like braille readers or for users who
>> need to use a larger font size than you may expect.
>>=20
>>> Agreed.  I'd also mention that in some cases (like the 50/27 rule and 8=
0
>>> character line lengths) the CI could give faster feedback for obvious
>>> things.  Is that something you'd be willing to look into automating in
>>> the CI?  I'm sure a lot of people would appreciate you doing so.
>>> There's a lot of low hanging fruit here that could be added to CI to
>>> make the responses seem less hostile.
>>> It should be noted, for most code, all of this formatting is automatic
>>> via clang-format, which is documented on the next line in the file I li=
nked.
>>>=20
>>> With all of the above, I'm struggling to see how you're wanting to
>>> improve here.  Do you think the documentation could be cleaned up?  Is
>>> the documentation too long to read?  Should we organize it in a
>>> different way so that the information above is easier to find?
>>>=20
>>>> The process should be somewhat predictable, preferably programmatic.
>>> Agreed, but throughout this email, I don't see any actionable suggestio=
n
>>> on how this could be improved.  Could you focus a little more on what
>>> you think we could change to make this situation better?
>>>=20
>>>> Mind you, I have no problem with complying with the maintainer?s rules=
, but I?d like to have some chance at getting a trivial commit passed on th=
e first shot. Two lines of BitBake config, that actually accomplish what is=
 intended, fetches a half-dozen complaints?
>> I don't want to be a killjoy here, but I think that's an overly
>> ambitious goal. I see very, very few code reviews pass with no
>> complaints on the first try - in this project and in other open source
>> projects in the wild. I think you may need to dial back your
>> expectations a little on that front. A more reasonable goal may be
>> "nit comments only", for example.
>>=20
>>> Assuming this is the review you're talking about:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2=
Dproject.xyz_c_openbmc_meta-2Dfacebook_-2B_25145&d=3DDwICAg&c=3D5VD0RTtNlTh=
3ycd41b3MUw&r=3D-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=3D12QUGCNeKzJ=
aeya2socKZls_OsPkE4dQVz5ydFylcr4&s=3Dx2eMFtQOCcaJ5Tq6rd6rIHLNYxxKPs72kcZyWQ=
vxlvQ&e=3D=20
>>>=20
>>> It was 7 lines of bitbake config, and it followed some project practice=
s
>>> that are deprecated and trying to be removed.
>>>=20
>>> Interestingly enough, I'm not able to find where we document the 50/72
>>> rule for commit messages, although I know some editors will enforce it
>>> when you do your edits.  I would've expected it to be here:
>>> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-=
changes
>>> Maybe that's an improvement to the docs you could propose?
>>>=20
>>>> It helps the maintainer if committers are able to self-police 98% of t=
he issues, and makes the entire process seem less hostile.
>>>> Also, there are too many places to put the same information. I quoted =
the warning messages I was remedying in the patch set comments, but summari=
zed in the commit message because that seemed like the right thing to do. A=
nd that got me another downvote.
>>> At the end of the day, the commit message is what most people are
>>> looking at once the commit is merged, and you put a single line that
>>> wasn't very descriptive.  The maintainer pointed out that you already
>>> had the level of detail needed, you just failed to put it in the commit
>>> message.  Certainly, writing this email took longer than just updating
>>> the commit message with more detail?
>> I wonder about this too. In my mind, posting an update based on a code
>> reviewer's comment - especially for the trivial stuff like "run
>> clang-format" or "reword the commit message".  If you're finding the
>> process of updating a code review with comments to involve a lot of
>> overhead, please cry out for help in IRC - it doesn't have to be :) In
>> fact, (putting on Git contributor hat) I'll personally volunteer to
>> answer any and all Git questions you may have via email or IRC PM.
>>=20
>>=20
>> Finally, I'd like to encourage you to think of code reviews not as
>> "the maintainers are grading my work", but instead as "I am but one
>> human; together we can do more."  Open source is collaborative in
>> nature, and a really large part of that is code review - all patches
>> in open source projects are the result of collaboration between the
>> primary author and the reviewers, almost all the time. I hope you can
>> see comments as "here is a thing you may not have known," rather than
>> "ya big dummy!"
>>=20
>> - Emily
>=20
> --=20
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
>=20
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.ozlabs.=
org_pipermail_openbmc_attachments_20190913_a21a342e_attachment.htm&d=3DDwIC=
Ag&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3D-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47=
kc&m=3D12QUGCNeKzJaeya2socKZls_OsPkE4dQVz5ydFylcr4&s=3DnFvHrZFPIKcnWWbbfK5d=
c8knK3wzHwYbNc_HcMxCWow&e=3D >
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: signature.asc
> Type: application/pgp-signature
> Size: 488 bytes
> Desc: OpenPGP digital signature
> URL: <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.ozlabs.=
org_pipermail_openbmc_attachments_20190913_a21a342e_attachment.sig&d=3DDwIC=
Ag&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3D-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47=
kc&m=3D12QUGCNeKzJaeya2socKZls_OsPkE4dQVz5ydFylcr4&s=3D013H58TIHWJAyfZPR2D7=
jt3SuZ8vGLhPuF5_wW1hRxA&e=3D >
>=20
> End of openbmc Digest, Vol 49, Issue 81
> ***************************************

