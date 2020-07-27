Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17F22F37C
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 17:09:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFjrZ6TkGzDrWV
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:09:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=047783edc7=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 1519 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Jul 2020 01:07:22 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFjpL343XzDrRK
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 01:07:21 +1000 (AEST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06REcLsI003250; Mon, 27 Jul 2020 14:41:55 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0a-002e3701.pphosted.com with ESMTP id 32gcqmxk79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 14:41:55 +0000
Received: from G1W8108.americas.hpqcorp.net (g1w8108.austin.hp.com
 [16.193.72.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id A759C9C;
 Mon, 27 Jul 2020 14:41:54 +0000 (UTC)
Received: from G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) by
 G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 27 Jul 2020 14:41:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.13) by
 G4W9119.americas.hpqcorp.net (16.210.20.214) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 27 Jul 2020 14:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1RkPdGkBF89nOUFNZJTCtUUhWaLVCJyrS2RlZt3ijV/tFmRkvwTEBjgFBShz2ph8Gu/9BMOm73+08snjwQAr3+gOgjOKNo2Gn4oIXARN4sDHkfBB1Wpr6tw/u2ARq+/OW/j1v16am9uxUrooeQyPCTkEFUxxru33ylNauTIQ+tNwkMN1kJkR9ZVisQ5use8xnEE79mWiQAql89jutsS9yWXwCYmyztJLfyDrDl31RXGnEukPyjd3aL7oz5f605ccH5QMBhSupCyUfRAi2ccmN2c7UBIQsHzw8LuYsPjALr6d59pY+DL5bs04ePboEM9p0DQLY3rn/dqMpc7+3Ymog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOp9mEDw/QWziuoTZk2jArC2lbdFKS1VhE9dBmCCPcg=;
 b=DYWABjwfPiVpyPNTaTb0rUPrOmZv2P8XjO7d4e3+qOVhet3EffeUm6IX9fB7N21jxSLUHP0c4WjguUNuH4XmrqhaBe3Y5xJzm5sj7At8TQIL+QsvYmcHk5d6e+s96p7R9bmqnnpjw42Ia+sfMPePRSlZ3Oi4eIk5WqU/vYqMKfHAc+BvXEW3q7OqxkLECBp6UwWkM5Gw3WCYau4Xfjke06rx6SuG8pNW5BWuO3wpnuj6X4JrjuWkDb2txoA/FItdC6Z07V/P0v1DJPtyNuuqJ/uCN7hkJGiPgl9rwjuvbwqQpY9L8T/0Ie8dnSpjJqjYxj1TXtYYDzI5bf5gRcbSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7421::16) by AT5PR8401MB0514.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7424::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 14:41:52 +0000
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fdaa:51cd:528c:f6c3]) by AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fdaa:51cd:528c:f6c3%10]) with mapi id 15.20.3216.033; Mon, 27 Jul
 2020 14:41:52 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>, "Chang, Abner (HPS SW/FW
 Technologist)" <abner.chang@hpe.com>
Subject: RE: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Topic: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Index: AdZiNn5KWJT9vXnOQm2LeRMxyQeKbAA6almAAABWi2AAP/i1AAAAhHiQ
Date: Mon, 27 Jul 2020 14:41:52 +0000
Message-ID: <AT5PR8401MB06262BBAB1DDDAE7B9BE80498F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
 <CS1PR8401MB1144271C5D55D6896ED55982FF750@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <20200727142244.GM3922@heinlein>
In-Reply-To: <20200727142244.GM3922@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [73.76.19.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f04974fb-f663-4822-ce7b-08d8323b33f0
x-ms-traffictypediagnostic: AT5PR8401MB0514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB0514ABB8B542CB68A364030C8F720@AT5PR8401MB0514.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NZIIE2J7WUFF0vaFFjSFqeEkzGOY16WAbzTe+lpt3pl6vUUlmuFXmuFW04k13eASlzyKlQd2jS97JHE9e4HvIM0f6ABwCgy6Vtav9ux/aSxmtqleLYxJnJ94O/of5pLG4SaunBevhlTXRfMO5ssLkV9aAC0JreQWKyMxWoRIgn8HRhxwFSZhZDG5sZVLLox0pUsKT0uItxsIl/GbFDWpJhpXuQSSIx9zWnqkuOZF/UpgQgAOUubd8Ht6O1JhSygpA4kZeFxfie5Yrvb0lc/lUtt5Hy41eqbR5a/UKygcrcnxKpxaBzbEOcZ6UkROGZyV3bBhXOYpuA6xDSnc+ONL4v1IXsrpaO7d5Ac7tRAYewbM/6/3iiIUGcHlJ2qvmsUjdxQgERJo9Z1MnPY2LOF/TQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(39860400002)(346002)(136003)(366004)(2906002)(86362001)(316002)(966005)(478600001)(52536014)(71200400001)(8676002)(33656002)(7696005)(6636002)(54906003)(8936002)(110136005)(4326008)(66946007)(76116006)(26005)(64756008)(186003)(66556008)(5660300002)(53546011)(83380400001)(55016002)(66476007)(66446008)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tFygFwd6Kg29oK/QljvzzP13rB5XK04ux7ceXV/LbcbdP2MMHTibmMpjBH6TA7L60SYuoD1kvAHIOOCUR9cFgu6T4s3eRxcWwvwGE4J9rPo+zA2cFNj/X9etuEsCmnpBMvSBRhWLNzLjRiAozZFztlQAS9tURSTrUSPshDjuK6tBU4Mg3C3VeEbyxz9/rIdi0g/3P5hLS+e+LKJndL6sidQVhDHEvAoK0a2Fq0csC35mOn48mufzrg63s2YDWwhTJh0ItftBFnfDUK/5jmNRnBQXkmFaL22P5TWPbfsdLCi/IkiOBAbtbWhzZfgCIOrXqWi/dlCdsxyEO5FzVOkfTWuvnpIPYXV0AMit7QM35hDJrOyLDl2ZpUHp95OhF3/QKU7N5bbQt8wAuUz760GUm3RyQh4mLefAGkUH+L2QakkmLS1IEXmBOA3sWR7CmuH3X9lbvpnTDsjeo5zFu2wpiOpF8HP0VdEeoH0zIfGepEo=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f04974fb-f663-4822-ce7b-08d8323b33f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 14:41:52.7054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DB1tbijoyXkEmhXTpQ6bQwOjR9HmGeg2lyiJXnlnsX08hZtNqgb0+qB/mWHD3DgNBnIr7B/FQFSHrBxnAT3TYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0514
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_08:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=983 priorityscore=1501 impostorscore=0
 clxscore=1011 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270104
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Patrick,

The CCLA shows the "initial list" of contributors on Schedule A.  What is t=
he mechanism for editing that list and adding names?=20

Mike

-----Original Message-----
From: Patrick Williams [mailto:patrick@stwcx.xyz]=20
Sent: Monday, July 27, 2020 9:23 AM
To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>; suryakanth.sekar@linux.=
intel.com; Brad Bishop <bradleyb@fuzziesquirrel.com>; Patrick Williams <pat=
rick@stwcx.xyz>; openbmc@lists.ozlabs.org; Garrett, Mike (HPE Server Firmwa=
re) <mike.garrett@hpe.com>
Subject: Re: Fix content rendering issue on RemoteBiosConfiguration doc

On Sun, Jul 26, 2020 at 07:55:03AM +0000, Chang, Abner (HPS SW/FW Technolog=
ist) wrote:
> Hi Deepak, thanks for the reminder. Miller also mentioned this to me. Now=
 I am follow the steps mentioned in Contributions.md to activate me account=
. I just signed OpenBMC ICLA and sent back to OpenBMC for the approval.
> Thanks
> Abner

Hi Abner,

I think since you are working at HPE, the best solution here is to get you =
added to the HPE CCLA [1] rather than have you sign an individual one.  Thi=
s gives us higher confidence that you are cleared for contribution by your =
company's internal processes as well.

Scott Shaffer and Mike Garrett are the two listed in the CCLA which can upd=
ate and add your name to the list.

[1] https://drive.google.com/drive/folders/1VOKT6mnBX1UjMQqKcC75-ir8GcLU1YE1

(cc'ing Mike)

--
Patrick Williams
