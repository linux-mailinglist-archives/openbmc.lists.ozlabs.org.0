Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE402A46C1
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 14:43:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQWFL6bzDzDqhl
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 00:43:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0576150549=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=WqugftXI; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQV9F4qqSzDqHS
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 23:54:16 +1100 (AEDT)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3CoIUc012256; Tue, 3 Nov 2020 12:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=uM/KhJhqphNyxOlFnI+cfkyvqRoMwprjxLBR0AWrlFM=;
 b=WqugftXIV9yYeYzpflW7IXuB39lIOURpU+xZe6QJMF1irOn+MzeChxojzgF9OHuEedPH
 XkNsdARbd4NJ4zhofpoMsHYhBHIOiwekxLqXgCAdSk7598ymHWiEqyhDZaVDDa6xDxQD
 TPySCJ3CrHSz5ZrVK1c1D9QiRRcEs3glIsUhBbnLjiq4GE6y90dtdRbZRailJ/PctYOB
 LUe2k3qhbpir6Db00Dzcib3Q9wJuriJeej/tGQiGpTFbOk/35DIVzvUTWnEjv1gIUyf3
 784p0h3wBeBcG17MZIVuFlIe+PPSdYhkRdXk7IF6J1CfyFJb0CfZC8DGw3BNG7dDLYoz Eg== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 34h17nqebu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 12:54:08 +0000
Received: from G9W8455.americas.hpqcorp.net (g9w8455.houston.hp.com
 [16.216.161.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5009.houston.hpe.com (Postfix) with ESMTPS id C888C5B;
 Tue,  3 Nov 2020 12:54:06 +0000 (UTC)
Received: from G9W8455.americas.hpqcorp.net (2002:10d8:a15e::10d8:a15e) by
 G9W8455.americas.hpqcorp.net (2002:10d8:a15e::10d8:a15e) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 12:54:06 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W8455.americas.hpqcorp.net (16.216.161.94) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 3 Nov 2020 12:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHhD5/cHUVYqXHAfu1tmWjJibrxPR2S3DHCj33rDC9oONq2hEiHrK+h5DJ15BgoXCMgnAxyiILhfMgeANX84CIrTxSnUjN9Dniz8y6kRFRpfrfIZ2bkHezsCXZyDzP4j2taqgMOc0UVozj/8LUolDr432jH1yODUnITv7s984YnacpfM1dlOctzTZ9qQar+sKhA7yMXGaU25BMvz88zxpuPg5zRfdE924VBK0BSOzF3zJUVC6jQ1o4zHs2sglmgK0Uh0/VYfGHG1yD93O5lyqPx9+T7mbTQenvCEcrP31GrRwxsk7QsXbWvEvn3yLAU2Ce6A2J/kHAFBtHhZBRs8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM/KhJhqphNyxOlFnI+cfkyvqRoMwprjxLBR0AWrlFM=;
 b=fjc7xIwvITh6rUv8WFfFMuzN9bAEqjSwDDpPqAoS5ooTp1UivIh7t/XCtGZRBYh5sZTTsoIyALGbVBWIz6RDGeoj2gk2KZVSpLYzDW6UEjspr7jOpDJDZb7CkBF/T/8oj48GTSR986I/HFKgq3zLJ5j9xYtSCMPeC/p0Lemn0usLCitZW61DI91iP7FOeugvuJIvg2KdUVFRgObFY7c/qMDXkGfP4Lh/oyF3wv4tvv/rqyu2iqppDRtu+dzts/v+ZIgBjVwJ5HDsDNwXgShuAE8q/OTQIubo11A9LPqVEFLbe1M7D2aeG09Xews8rBUJ4QcbK/GMWUj5HFssP2CWeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7421::16) by AT5PR8401MB0545.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:741f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 12:54:05 +0000
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::a169:486:205d:484e]) by AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::a169:486:205d:484e%10]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 12:54:05 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: 2.9 planning/progress docs?
Thread-Topic: 2.9 planning/progress docs?
Thread-Index: AdZkJbvWnjJk2LgpSgqzmxj9m7NxPgACDiGAEpNrUoAAu0lhgAAdxJGA
Date: Tue, 3 Nov 2020 12:54:05 +0000
Message-ID: <AT5PR8401MB06262E3EBB456B5EC09F13518F110@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
References: <AT5PR8401MB06263771D26D0EE53D41A5818F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
 <CACWQX836VGj9JOB+h75cODoti9+0mGeMioQbdiTwmVG_8ydFcw@mail.gmail.com>
 <4e6a40c2-a059-4928-8ccf-db060d6600b2@www.fastmail.com>
 <20201102223743.GH3614@heinlein>
In-Reply-To: <20201102223743.GH3614@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [73.76.19.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0eaf1da1-d612-44d8-5c3e-08d87ff78bea
x-ms-traffictypediagnostic: AT5PR8401MB0545:
x-microsoft-antispam-prvs: <AT5PR8401MB0545EFCFDD4545F9864EDBE38F110@AT5PR8401MB0545.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VFHMmGPSbHwb85NgiVeKRBAaWBPWidDU9u/v2kyZgWJqSC5LpkhHWKPbeMvrWL3xLQMepuBBQkT96G7oSI54/30xAc+DfLYUfsorEraWvcLhU404X09G/ShykLgV+A9BXggZqIH/hk5KreuGqlqUB8OWbpV8jjxHb55fZogrvmCnSv5x8bxFnlsvY7PKY3EK7RSpDpQLwIdgcs7sF7YTDsKCKcHirDC+v+6tt/FRP/V2a6CLhjyZAH3TO5BGdhejLyfhWNigG4QarwwREwqqmROn91Spp07iZNi0hgNbJwYqOf2OksXTVonxRe0maiDJBMoM4H7DM0969cbDBRk8Jw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(396003)(39860400002)(346002)(316002)(110136005)(83380400001)(54906003)(478600001)(76116006)(66946007)(66446008)(64756008)(66476007)(66556008)(33656002)(52536014)(86362001)(71200400001)(5660300002)(4326008)(2906002)(7696005)(53546011)(8936002)(26005)(8676002)(186003)(55016002)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FFF1hJiNxH+itEaqeMDxrUtU2059f0UrYibnsBQIdmjWiMiJj67C0XZCcGl0CG6CGxG2w/z3a6pqRBJkOt/xecLN6QPoFPTgo1M91SZ3fpGkXPPQdukhhYzHgaf8Z9y3USf+G3CoqVa/jrDhYdbqFNOR1wp4EXEqaC48Ol9rMxKvo1/ki0Wkdi4dROqffwuMC9gwVPMzMEE0ieGD0dm5ZlytYtsWuZtwWqImvEUzf4/r3z5cB0El7cWHWo9VK5WQl5Kpn/vygXuxYD7viwZ3eIc5MvaJBI0Gq8YUz1yXrF874mlh+MNMucANvdUvY0W1NUTFGov4EhDXEv1G7oaySlHSsovnPkSRVzDcoui6Puv/ckOYsjLvEBhURivzfrtof24K508pvg0cQE7S8bBdSy3rQHZXUe7l4jp8EfRg4vXWW+gKEAxPMUAltYhG7L6aSC9HnCzjChd5GlMlHUAHuLftqO7H9wGP5DbpQWYRwNHxf9OXcQ3LBtNrhcQBZdx2aKpuVi6kePAvNPqUfcT7YbXU0q/k7z3FkbP3P+4S7rtM4Ww0qdwaqn6ysIVI0GUVlKsgtwb0Um4rxXai/gWuCNrcH/Jk+SIqkvOGh0vw4njbxQlCKPISA6R5+fY1LhbVOgRBuqug59WIcebMFTtJsA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf1da1-d612-44d8-5c3e-08d87ff78bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 12:54:05.3177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+V7LPt/unDfFT1xmowNVLqn3R+3+6rPPvIXm6xrjCPKxxAPHRU2hmFRyOIIiLZb4ET5KOfGuY3RbetU3Ii5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0545
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030087
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
 Ed Tanous <ed@tanous.net>, "kurt.r.taylor@gmail.com" <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the clarification Patrick and all.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Monday, November 2, 2020 4:38 PM
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Ed Tanous <ed@tanous.net>; Garrett, Mike (HPE Server Firmware) <mike.ga=
rrett@hpe.com>; openbmc@lists.ozlabs.org; kurt.r.taylor@gmail.com
Subject: Re: 2.9 planning/progress docs?

On Fri, Oct 30, 2020 at 03:45:07PM +1030, Andrew Jeffery wrote:
>=20
>=20
> On Tue, 28 Jul 2020, at 01:22, Ed Tanous wrote:
> > On Mon, Jul 27, 2020 at 8:22 AM Garrett, Mike (HPE Server Firmware)=20
> > <mike.garrett@hpe.com> wrote:
> > > We have some patches for dbus-sensors specific to our platforms that =
are frequently being invalidated by updates upstream, and instead of consta=
ntly regenerating our patches, it would be nice to know when the upstream h=
as accomplished its goals for 2.9 and we can regenerate our patches once.  =
We are still getting acquainted with the processes here.
> > >
> >=20
> > The best answer here is to get your patches into review and onto=20
> > master, then you shouldn't ever need to regenerate your downstream=20
> > patches again.  Pushing a gerrit review is significantly less effort=20
> > than even a single rebase, and you might gain some valuable insight=20
> > from the maintainer doing so.  I understand the realities of that in=20
> > the corporate world are not ideal, and sometimes you have technical=20
> > conflicts that are hard to resolve, but at the very least if patches=20
> > are "unmergeable" but in review, the maintainer can take this into=20
> > consideration when other patches are merged, and possibly point out=20
> > breaks.
>=20
> Very late to the party here, but 100% on the above. As a maintainer=20
> I'm not really prepared to cater to code I can't see - taking the time=20
> to push your work to gerrit will get my attention, and:
>=20
> 1. Help me appreciate your use-cases
> 2. Help you reduce your maintenance burden, and 3. Help others who=20
> might share your use-cases.
>=20
> It's always possible that others will pick your patches up and get=20
> them merged for you.
>=20
> Andrew

Good points Andrew.

It seems like in general we have a common misunderstanding about our releas=
e process.  Maybe Kurt can weigh in.

For the most part we have a time-based release cycle and not a feature-base=
d release cycle.  This project isn't ran like some products where they say =
"we're not shipping this until feature X is done".  For the most part, peop=
le are not even able to effectively communicate what features they *are* wo=
rking on and *when* they plan to have them done.

The Linux kernel also releases on a time-based release cycle.  There is no =
where to look up and answer "when will I be able to boot a kernel compresse=
d with zstd compression?"  Someone decides they want to work on it, they pu=
t the code up, and eventually it finds its way into Linus'
tree during an open merge window.

Our releases have been pretty similar.  People work on code; code gets merg=
ed.  Eventually the upstream Yocto release happens and someone
(Kurt) volunteers to manage a corresponding OpenBMC release.  Whatever is i=
n at that time, is what is in.

Maintainers of the individual code repositories have never managed a "close=
d" merge window in order to stabilze our code.  Code changes because someon=
e contributes it and the code is approved for merge.
There will never be a particular point in time that a maintainer can tell y=
ou "I'm not going to merge code for the next month."

--
Patrick Williams
