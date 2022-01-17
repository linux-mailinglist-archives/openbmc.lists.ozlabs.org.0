Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AC4913AF
	for <lists+openbmc@lfdr.de>; Tue, 18 Jan 2022 02:40:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdBKt4SKNz30QD
	for <lists+openbmc@lfdr.de>; Tue, 18 Jan 2022 12:40:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TsbAQAES;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.129;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=TsbAQAES; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2129.outbound.protection.outlook.com [40.107.220.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcyCR4Fxpz2yPp
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jan 2022 03:33:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7qPBHTkKlyxZSatthMxNIzKZmRxm8JIl8F0njAqsyAIpjwoItWteoq26yYBIIU+zwiqpUpjYUqWbCqZpRfmM+4MB65e86zbJvpGWbsH4+9iB31CT0wDxza/wMNi9hOn1T+hvalduMaz8Q3xD6iIbDCJswmsQiSG28hDZJVEmCvGxVSI1xsX4ySNbWPLMW+T59oDhQjMDbTQhPSpxjdQMuLyWTLJqnRYIY1JLDsIlswDOdGRkUxrwCYzspM5KJWE43Vf9qqb3jU+zh2otSFW36oiecoatuj/jfOKvMFrs/dVqP9NJ4o8A5AY2eKXtkb9sJTLzKBx5xl+sV6qDOw/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUPFiWwDEudka2ZJil0dZgV89oD/9uHUCMhM9QkWcS4=;
 b=BbVVFoIFnOhHkXLcnmzGXNjTUVAn+Iu5r3FKwj5XRRBDVkBjdHMGIFN/OXd9Kvn5M5xQAibesGApLkH8TZa201xSnh7XNuVUjLhQGq4PS+kyrTW0WU39iI1WClEz9pT3y8ja9TbPQHH7XxP2aIIXUE5FrZNjNxUSI2OK2BfZd5RSTA5jkd1WRyAH4d5vnjaSY6vfSL8K16YzaATZ/5BsDdnzhy9Tbh7FHBoBglSryjA4+hlXW12/EZXpoT421tysJkdbqcw33FSMks9uIo7W16msYUj+wRl+UePHHuL2FjW0hPZH+W4a4munkpmwSwPd0QD53jV6mzPPHFesJVNRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUPFiWwDEudka2ZJil0dZgV89oD/9uHUCMhM9QkWcS4=;
 b=TsbAQAEShWLD7twfrW1EzPBufejqNTbZYDez5LGrExKAjIcncfUJ3SKaPj4M8I+LXbpzt/RIjw4sIDHrAaSKwiUb0NO3FUgRpK01g1TSh+k4Mz7aDLvYM0yXni7I7wpAoB88Jaw2Ry7C1KvArAmcdsbWZexptPm02HW6TzWORas=
Received: from BL0PR01MB5156.prod.exchangelabs.com (2603:10b6:208:67::13) by
 BYAPR01MB4504.prod.exchangelabs.com (2603:10b6:a03:a4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Mon, 17 Jan 2022 16:33:31 +0000
Received: from BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::4c74:e515:b548:1486]) by BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::4c74:e515:b548:1486%4]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 16:33:31 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: MCTP/PLDM BMC-host communication design
Thread-Topic: MCTP/PLDM BMC-host communication design
Thread-Index: AQHYC73kfl3LazavgkaXDWxfXPa3zw==
Date: Mon, 17 Jan 2022 16:33:31 +0000
Message-ID: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7bfe60f6-65e2-5d19-8a48-57f8ea58782e
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b33e0950-4220-457b-c04c-08d9d9d71941
x-ms-traffictypediagnostic: BYAPR01MB4504:EE_
x-microsoft-antispam-prvs: <BYAPR01MB4504BAACB7AD0797BD66DFF5FF579@BYAPR01MB4504.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lOL3olJVrABNFw9QN49iHkmpR3rh8Qt7jEZqG/KLvz+LmRHZ203dmzBjsi+LiTkVBgDA6uA9bPT7q45luZoHqCuhrVH1QdLNrIzHS3X9EROTrE4xJ9O+TjW8ACL3XcbhJf1ZM1Xf9ROzUfZlEd3H7HYdyvCiSrV1FWUaE5XOAuYNPLHvZC01slf8cH2LsuQtVJNS4QDsYf4O2DiK0Cr2StLc3YZ6pglDEuO3TAB3XgBrYz6W2Vrn/pPNh5w7jY2/7QrdEBIXPyJvMMszGDBbunF2Z94Rz9blxYsIYPgiEk4sn5I+mztqVDARx+RlKYKyfdXd0ZCLvRs3cK+FAvdjAwBos7klgn16ZxdQ5r3uhJ0tDCJE17R/TPjP2mz6fIHXI+We/J65f7eu53Gb9wMBb4CgJDSEJ0dw4iDmXoSMrRM0AbKTyvSy55K4XFWod0SVORAG/BEpeWRhPlt9SS+wicGdGzndF00vsL2YysrkqIH5XQQHbBD4RuOUbdfDqkTqAM8IIbaEomooGrA31T9PuWSLiDh6RH0Fq0Xx97yh7WN5NiPyCFuTAdXxTJjJ4IZU3d9cGThoxgEc8p4kXkXjplJ9NDrAeVCeMK4nnV2kwgAjwvXOGge8kHmTguolSy3MIXBMaCiEyOb1nnV/1KU75amC5LTTOho/kI1MsSofhRjtU+JVJPGok2JHe3nR6J/V1PzLuUgNKkacMW1cVhiavomu8IBF85NqsJtl/0Y4BmuijiINvgAuWT/rOaDy7vz8Kz4E/ouYtOK4w2K0uOmqSjUdBLIUzmxew9k5pz42Tk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB5156.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(2906002)(38070700005)(107886003)(52536014)(6506007)(66446008)(3480700007)(86362001)(8676002)(71200400001)(64756008)(966005)(5660300002)(66556008)(91956017)(8936002)(76116006)(33656002)(66946007)(66476007)(186003)(508600001)(9686003)(54906003)(122000001)(316002)(55016003)(7696005)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Utp1eKq5fVwosYXMLvVLhTj6Vi7NLu1QKJUM5ZcFyd9DxNRzqp15kkTCVU?=
 =?iso-8859-1?Q?B+EGeMXdlIsEl/KglkxyWHGbxDVdlbbtmzGBNc9Kz2BEDXVeRaEhwWw3TE?=
 =?iso-8859-1?Q?H45wMuq7p637x841VZc58c8YShLrtM7PI3ql6zK0nkCI5zoOxgYR1Pwz23?=
 =?iso-8859-1?Q?9T0KTIpOxtEWZN9BAB5AVcpmKnrwnwqbxeYhLatjf4P6vnqN8pLkiih0SG?=
 =?iso-8859-1?Q?rqKrbq9aSN4vialkahhhCuUXZMIv75ZURY0STXvJpOBFtwPVZGk/wIA8Bo?=
 =?iso-8859-1?Q?PycOQVoO8oa36C3roiGYI7OwMcHICR082hUzx3NzBe8Rbp0Q7iIvTHJmSc?=
 =?iso-8859-1?Q?TEbDU/7BKN74YUOv5jgRJz76pH4R9y59yw5uwsXxJarwj7Q1c5kKBxY8O9?=
 =?iso-8859-1?Q?uZkZ4S6s2nk3fGWd0aHlSARv47rFmshCfIOyizwf1u1m/HHZWymx+GIDLA?=
 =?iso-8859-1?Q?yqpSuZM3WzuClArU2ftO/hpHjKqay4/PvdwsQcCFjAW2zcvdQIqXM+zoaH?=
 =?iso-8859-1?Q?OKFLmbfxSZvE+/1NGcBtMBem0wBpdp1FYN96lqW62AvJ9nvFZxvkhnHZmW?=
 =?iso-8859-1?Q?5CsO4hbS+FVMW+brQPdkDtnFlvrtLEQNl3q0mwoQQnouvidAf4uoGmAsYz?=
 =?iso-8859-1?Q?Ykr4kj20FukT4SLz3k3XtGzgBj54kX6Msxto0/I3QnuoAKLrl/TkO4hStD?=
 =?iso-8859-1?Q?np1BGnlwGjNU9HhgOcXQfsbiZLsXSfeprcK8SgXsUOhFnQgdm2elutDPQJ?=
 =?iso-8859-1?Q?VhxVVdYnaReUVJ9cm1+Z8GobfUKArm/jheAqfCi8yEMxe+CX3TtaS3Gprn?=
 =?iso-8859-1?Q?xvvbQa7c04SN4yHTBle6c8c/z6GbCILgwNz8HZpkQB0/HuDQMsxgqesIh5?=
 =?iso-8859-1?Q?tFVTM+79EvxX/CR6qTE7b5OEJP5kRdj76qBdfLnTppkfHIm86s3yRF76tE?=
 =?iso-8859-1?Q?eEQQt+vZIgxSUQ7Grf1t7J622onPRezjqPdTLYvmyTJCyBvQo66CMSztKk?=
 =?iso-8859-1?Q?jfsMIlsxIvbq9VTaXx2Cf4BPorg7FCu1jbWfWRNXGYJyuzjWXAHbDislw3?=
 =?iso-8859-1?Q?C+6qTBnNALxiAxrR2IpsXhuisakCgWssZr7L2mJ0/MUZfmitycCwcM5YVJ?=
 =?iso-8859-1?Q?ZJJ9AXNHwcG0WIl5J5M/1XxlJhaWwB92hItsrPvO59JdzHL0Lehh8A1agL?=
 =?iso-8859-1?Q?JnSt+aw50qQGHjvmiC7WoBoNA9K8XihEZ1PZFSuFvmyKFqW39etKNxmiqu?=
 =?iso-8859-1?Q?fRqZMEF6e+GK5hmaYuwWbR83Gu134N4jEScxL9Imu6mb40MrWmNzs0lodc?=
 =?iso-8859-1?Q?AbpS3/lcR4QHVQxXUIBgjLJQc3u2vsvcd/yf3ujGUi+twyVeaHxWQW71W+?=
 =?iso-8859-1?Q?bXtmVYK51I84wmWfAOXOPP1wQMjlrbEtPj/ekufexQPZl4k0eozhqQ2EgH?=
 =?iso-8859-1?Q?/PoPsesyiEywQED22eZ5ESeYHJD5ECpYJ6QmKMNJk2rWwGDhi5vPVmXKO3?=
 =?iso-8859-1?Q?O4aYfFjh4xa1TvBPRhZl90LCqBsnTR1+uZEAo+mvN30iZAt+qCE074UhAm?=
 =?iso-8859-1?Q?3bTtMkAScJS71899KISYnhfuzIsDdtesaub4H2ft+AL27UFZBsWc+4Ku5u?=
 =?iso-8859-1?Q?24lCete3C4torcHS2J5MyMq/yHoKiMyzLIcpMoRmXUMxt61Fn3V1Yb8mHL?=
 =?iso-8859-1?Q?I4tUe5g/EyFU+B5Zg/MHxTFI9AzieIMRycbZcu+7IoXGMX8RWC6vJpwtMk?=
 =?iso-8859-1?Q?GJw61IsbBhZyZfOmCS2E2DsuQ7SFYMDalY2lsqergATKsDPDYz0KAvAGtV?=
 =?iso-8859-1?Q?rtY2YrTXjjoW+8hkEZAqAawYn/y2ZdgjoCylDoe6GMTp2TBMd9Cg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB5156.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33e0950-4220-457b-c04c-08d9d9d71941
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 16:33:31.2071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mf5YI1JiSOrIsw7qDRsBabIoQFW77nu4VI6PHAOw4G8OzjB6V5oBpZRl5/GEGNWWCEtlpeqGLrp9ACtZHtxGoIQYXL4WaklvYj4KV5+UEoY9r9UC2BXVLH1cN0Kl36Jx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4504
X-Mailman-Approved-At: Tue, 18 Jan 2022 12:39:57 +1100
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear community,=0A=
[Switched the email in PlainText format]=0A=
=0A=
We are using community PLDM/MCTP code to design our MCTP/PLDM stack via SMB=
US on aarch64 system. Basically, we have 2 CPU sockets corresponding with 2=
 SMBUS addresses, and the MCTP/PLDM stack looks like this image:=0A=
https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd39303=
bbb6e9c8a6f646/current_design.png=0A=
=0A=
Due to the not supported of discovery process, we are fixing the EIDs for h=
ost. During the implementation, we recognize if we use this approach, we wi=
ll have a limitation when using the code in pldmd and host-bmc in https://g=
ithub.com/openbmc/pldm=0A=
Where just only Host_EID is using. (It might be improvement later here). =
=0A=
=0A=
A new way that is considering is like the image: https://github.com/tungngu=
yen-ampere/images/blob/7dba355b4742d0ffab9cd39303bbb6e9c8a6f646/new_design.=
png=0A=
=0A=
In this way, we use an EID for host to communicate. The master socket 0 sho=
uld self-manage the host devices like: sensors, effectors, boot progress ..=
. etc.=0A=
=0A=
I would like to hear your opinion on this if the feature is applicable for =
your systems like what is pros, what is cons, what is the performance, what=
 do you prefer, other suggestion... etc.=0A=
=0A=
Our target is to make the feature works and support the community..=0A=
=0A=
Thank you & best regards,=0A=
Tung=0A=
=0A=
=0A=
