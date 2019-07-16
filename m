Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533636B14E
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 23:46:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pDVf6gyjzDqdr
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 07:46:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=21000e3c6e=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rL39OKic"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XjxWkffV"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pDV06DQhzDqcn
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 07:45:39 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GL5Cck026943
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 14:45:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=KwU11/TfQonLr4EqWLOTYvjab/4hb5PaGiYnaiH5QNA=;
 b=rL39OKicCC7dkhWO9GoGkv7TLS3EspZA3hJqkgTDIB8VA7qAuwmsa3Eq//Ec4At+tSgk
 WcKhD0xnVAmzH3WoIAyO27iCWyAUQ3HoQLJAamXwIrmUwYmgob2ll5XymTtpXb+9NsK6
 jPkORT1P7zvD+kw2HkiIdl470K4mvdKCJOc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tsgg8sgv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 14:45:36 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 16 Jul 2019 14:45:36 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 16 Jul 2019 14:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QisxTBRimKRhsfo8lUPZ5WYGc0Sq+3Bmam1ILsl7IOQ7EanXJ1Qk/4YtABSjx4eQFxYO6a7XpdS09L5qfEWGtqVeIJaARqyOtjHZjeHzjOdPpXJfpMtftIGtBxsuT9mvvCcweT3VgJbR47YvcCR46kFR9uGGPk6TOJmTIZIEvtOO3HgFi4aYlT4mQIn40H8/YXAmwOV+53hfb+c5zbK/CP/EvZxm32qpRJwNLd+URz7ovMwtgNkTNbbrDQKfPda7VWPJvqN+ke70eh7dQoUper6XxqijHGNbL13bgO/VFtZh3/EuNVQnj8nR5OQMUJ1ptCjLwSiATMZ4yq2tpqOV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwU11/TfQonLr4EqWLOTYvjab/4hb5PaGiYnaiH5QNA=;
 b=LfMn4MdtqJ1d5FCmmzIoIXvFjetYCFSbsQzSMUUKxeeQ47d/5b7y9CrGy8xxgQhPKsKrehDvvMvWczWAkipKeQsU9oN55Qo/bRZdeFaGkVaz1vpeZYc3Mzm6Lhj8+Aab628q9S7VpZXyUTVJw2KKNfsoAe+nu9jfqhxNfOQ4DetIcpZfAIQLPyqjcWtm/MU8z8qLgTbCvtJYStFTz7f55UbBnj7MUAi1Jw4vW30jp6FgerHxGZV6qyGClfDAyZzmIHzRxLeCCeu7WuhkinKljQq4bi2jWv6pRF44nUEJxL63dE5ZYBlUIKD2XyBVhMoW8WWIiPz4E0lsme474Ze7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwU11/TfQonLr4EqWLOTYvjab/4hb5PaGiYnaiH5QNA=;
 b=XjxWkffV8V68cW5P6xs+ozA3RIVqIHkaIcV1KHjlctL2oMVJpl5poEy+niYNzZfxb3MHfFJ3JA54n2ldFvG/Qrp0wtl6pdeK3Lw99HiLQmuvKsvWbP+S57i9Ds2f/iHXxM2wnlEO1Uz8tIAbRRZ0ZeN8fwNPmB1mDC1ExhY96mA=
Received: from MWHPR15MB1327.namprd15.prod.outlook.com (10.175.3.12) by
 MWHPR15MB1567.namprd15.prod.outlook.com (10.173.235.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 21:45:35 +0000
Received: from MWHPR15MB1327.namprd15.prod.outlook.com
 ([fe80::dd20:6a1d:5127:a789]) by MWHPR15MB1327.namprd15.prod.outlook.com
 ([fe80::dd20:6a1d:5127:a789%4]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 21:45:35 +0000
From: Ben Wei <benwei@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Out-of-band NIC management
Thread-Topic: Out-of-band NIC management
Thread-Index: AdU8H8pBvdsVlvP/RSqN9qCJJOBAZQ==
Date: Tue, 16 Jul 2019 21:45:35 +0000
Message-ID: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:ffdf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95739308-049b-4049-59b5-08d70a36ef32
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1567; 
x-ms-traffictypediagnostic: MWHPR15MB1567:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR15MB156761FE784EDED3E76C16A7A3CE0@MWHPR15MB1567.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(396003)(366004)(376002)(39860400002)(199004)(189003)(53754006)(55016002)(476003)(9686003)(486006)(186003)(102836004)(68736007)(5640700003)(14454004)(46003)(5660300002)(53936002)(2906002)(66476007)(66946007)(8936002)(7736002)(64756008)(66446008)(6916009)(66556008)(1730700003)(478600001)(99286004)(33656002)(7696005)(305945005)(52536014)(86362001)(25786009)(256004)(76116006)(6436002)(6306002)(6506007)(2501003)(14444005)(8676002)(6116002)(3480700005)(74316002)(2351001)(81166006)(71200400001)(81156014)(71190400001)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1567;
 H:MWHPR15MB1327.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M8oXVrPwfUqQu3u2xS6Ygu11qYUxAU2GDvo0Ge4U8ulcYk8hiudm2Is69h2IZenKnJgAbZgc4AYug08/2YZqlw5CrkZLbLxMQQqvYDWqqdwiqr6tZ7UsFrpi/Xmw/NVnRmxtV2ttFja8dWFntvDHcgDxmjFSBHowK7uhNJIMBVcFvbCVyFnltZhC+sPDTm4t+OVndHdjlrJengbKQC75ZNRCCrvqD2nnMX30tdhZIBp83WT/U7klsfhfsq3HqfCIo4XM4IO1AnFhz7V+ns/1M0DARWNS8nZMJAv0Lt/F6s+NiIPq8iqJITQ6bG+NLVBNfIy4XTu35lAmXG76sgvLw/GAdqr8rHeVdxRxrzFVAezvEV6Yng0UmDqdZRaJaCIINsB73Da7fG9rk8qDK1IahsPllpbDejFXkdhd3we+j0o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95739308-049b-4049-59b5-08d70a36ef32
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 21:45:35.2489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: benwei@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1567
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160259
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

Hi all,=20
=20
Would anyone be interested in collaborating on out-of-band NIC management a=
nd monitoring?=20

DMTF has as a NCSI spec (https://www.dmtf.org/sites/default/files/standards=
/documents/DSP0222_1.1.0.pdf), that defines a standard interface for BMCs t=
o manage NICs.
And in kernel 5.x , NC-SI driver supports Netlink interface for communicati=
ng with userspace processes.
 =20
I'm thinking adding the following tools to OpenBMC as a starting point and =
build form there:
=20
      1. A command line utility (e.g. ncsi-util) to send raw NC-SI commands=
, useful for debugging and initial NIC bring up,=20
      For example:
          ncsi-util -eth0 -ch 0 <raw NC-SI command>
=20
      We can further extend this command line tool to support other managem=
ent interfaces, e.g sending MCTP or PLDM commands to NIC.
=20
      2. A daemon running on OpenBMC (e.g ncsid) monitoring NIC status,  fo=
r example:
          a. Query and log NIC capability and current parameter setting
          b. Periodically check NIC link status, re-initialize NC-SI link i=
f NIC is unreachable, log the status
          c. Enable and monitor NIC Asynchronous Event Notifications (AENs)=
=20
                i. such as  Link Status Change, Configuration required, Hos=
t driver status change
                ii. there are OEM-specific AENs that BMC may also enable an=
d monitor
                iii. either log these events, and/or performs recovery and =
remediation as needed
          d. Additional monitoring such as=20
                i.  temperature (not in standard NC-SI command yet),=20
                ii. firmware version, update event, network traffic statist=
ics
=20
Both the CLI tool and the monitoring daemon can either communicate to kerne=
l driver directly via Netlink independently, or we can have the ncsi daemon=
 acting as command serializer to kernel and other user space processes.
These are just some of my initial thoughts and I'd love to hear some feedba=
ck if these would be useful to OpenBMC.=20

If anyone in interested in collaborate on these we can discuss more on feat=
ures and design details.
=20
Regards,
-Ben
