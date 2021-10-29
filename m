Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF5743F85E
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 10:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgZfc2hthz2yxL
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 19:02:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=n+lsIHRy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=5936856f4c=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=n+lsIHRy; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgZf31fkDz2xsN
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 19:02:17 +1100 (AEDT)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19T1rgKE027282
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 08:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=UQP3uiMMRy+zpGg2+ELar3LII4pAdE3r0xWiOh0TxTw=;
 b=n+lsIHRyxD4RqOPvTf9cRU1xIYZraZ0OhKoAFG6Hm4VhpcJeItnasqrRXUYcWDoaCBN1
 4R9cjiM4x9xilNoiZgi0Ew/C5xS0XiaxaPfmMovYJJiRfOl/pRDjt4sLNSZ0rYNqsUvT
 wb/Enzz54Ws4RWtmyIG6P0ACAv8DpMCVoc6AH4WGNP6a0qiJpnZv2a/vdAa5Win2JUDT
 k/qGSP4Stq0yNsg2amGrwyMDS+9ZoPFlPO8yF1vd+FSEWg92zat29nH1p3k8172ssMNo
 T0o7RpLgC9eUfmzmAtBtqVDvcm/M0eWWwlnJ469QyOtn/VIJYjGTCQjv0AdnPbBYbye9 gg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx07-002d6701.pphosted.com with ESMTP id 3c07pdhqug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 08:02:12 +0000
Received: from CO2PR04CA0143.namprd04.prod.outlook.com (2603:10b6:104::21) by
 PH0PR08MB6487.namprd08.prod.outlook.com (2603:10b6:510:35::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14; Fri, 29 Oct 2021 08:02:09 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::7) by CO2PR04CA0143.outlook.office365.com
 (2603:10b6:104::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Fri, 29 Oct 2021 08:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.17)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.17 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.17; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.17) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 08:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYAbTKqYqQ0bIp1Jz8k8Vyw2wzl2hEfV67nS2yNxPDxnk5zA/FQ/WZoeLFL0008CpQYgl+azH/cvwqvgz5h+uwApwTXqDRCRV8Sn/dly/LhQmBez+JELyiCNPrvoYOgNm6ZIuYGYU93u5cQMmTshlHU4RPntgGYaupIW8guK/nW0qCRGT55a1LGvxtOAucxT8+XBWx8AyjKRED4f2qAf83b87KTLipnLEy9+jop85zaIsL6fbV9yn0vNEZn+Hj1AMYRKjsQ4pOD87Ugubbue+M3md+vu8yjFEGe4wvm02m/nMP6tNYI4aS1eh+kPMFRsuegdJVlFju2+4MrApQox3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EcToFdACD4nWlpP20FhdmaetxJ10vU4ezgUuNVBCVU=;
 b=duMeVnYMvx7oQbJpZclrAW04w3Gq17aCwmJf+1B302rv22nVdxbJYhPPNJr4wo6HO/Tfq91E1I0Sx5fZ72spUTlgW/5qM/cZet5ZD3idCzYpGLrn9Rj/zDDF0EOEq3OaJwBirpVp54V3MwPsKtS9AWakQ/g83aXIKI/mYJMZg+FuNoJkWM4KaKCR8LdXFaHDLNGPge0gpm5ZSvtLNbw722O4aZ7EJfM4pnigSoPTRwXGXlCirOEFVXiP7KyDvqWH/aGr5iEqnGAp0aEdxASo6P3K5Txmk9pCI8kYrEUEx9LF7f4Mzty7f/q7Ldf3bdKgBLGW/4mO9/lF4w1W1/kE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR0801MB3736.namprd08.prod.outlook.com (2603:10b6:4:81::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Fri, 29 Oct
 2021 08:02:07 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4628.020; Fri, 29 Oct 2021
 08:02:07 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [entity-manager] Question about temperature sensor stops update
Thread-Topic: [entity-manager] Question about temperature sensor stops update
Thread-Index: AdfMmz3NOQzNV/g/Qrqy2k/lLM6/kQ==
Date: Fri, 29 Oct 2021 08:02:07 +0000
Message-ID: <DM6PR08MB5514480BAD48B0B200646011DC879@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 1087fdce-53eb-9d7a-4c13-3469a8327e41
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c1481fe0-53ff-4337-1040-08d99ab26841
x-ms-traffictypediagnostic: DM5PR0801MB3736:|PH0PR08MB6487:
X-Microsoft-Antispam-PRVS: <PH0PR08MB64878A92A796D7CF0CDB8D73DC879@PH0PR08MB6487.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: humIzp8v4nFWd+prG+WjGLOdCkODd3qGln99ZvKwEYXKVcexX7c5/aB5dQ3kWDK49gTwuE0GbJlA0q/5hf1QfMuDLLSgRliOzcXUxqwiKVQPuBbwP2/ZEcbCw0OxXtN1c+RJncs7nc5Gj9bD3Rr2jqiUBrgz9rm6FaBoeYdb7CDSS/ySDl/DDyW1iZigXzjHbFDCKG5TO++9Sxs3LtquuLUGMl8uIVhNcomSsRpT8Qj0e8AU8z+XoTrmv8j8lTGPes947tl/ejEyLAq3tVN7X4T3JWNDgurOaaLzMZ8ufqRbfuWS/mhYBdWTPbaZHxAN0HFZCb2tkvFcEq54X7rRUxTdtWC+MIox839sjNyL8T/qbEFvtGkfW3v8q8EyR38O6XSqk4ru0fPxXqKNfuQQ94DrHY1/mPCmetXNUmvyrtZd7iMSz550L2LyEJ71HKMYhmhF3iHr+MYKBjISWm8edRrKeM/or9xTNpN9LIJXiSPjbYvEKLYqbKp8DkAL8HJ7NgXsHQjyufsbSLpgpJVXX5E7IC+KibQ75Kh4ceORIKQlhKIWl7cbkJL7TmW+KF9ugrdEZuA3cKeHjHe7z8nINKnW9EkrihAhL7WWa5ImC9OqFTD6oHovYVtBDS0aWLnPwbKhYSTGswDL4Iz0hUmpiKBXCFK3Yao0W4Uq9kSGKTBwl4s/APSEaULYhapJ+SVLUMf1GV5yvZQyOuwipA3JIQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(6916009)(66476007)(64756008)(76116006)(83380400001)(66556008)(66446008)(122000001)(9686003)(508600001)(38100700002)(2906002)(7696005)(186003)(316002)(33656002)(8676002)(86362001)(52536014)(8936002)(71200400001)(38070700005)(66946007)(55016002)(6506007)(5660300002)(15650500001)(26005);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514480BAD48B0B200646011DC879DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3736
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ae85818f-253a-4d41-f3d9-08d99ab2670c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3/cw2l+eyKWX3zQ3bHjqkDegFnuwMYZrpoJr5K/8AVBc3Q1Q48eirNnCPKmOeiN0UFWkm0YzjzKPh8FIwXs4tdPTycX/8HEadZuTO28KE6/uBzIw0EbMmkA6KldedkzU/CHFL87kdkKCd236QcALRcW5ElW4JKYutYSHDonacsEf/5hHn4Tq+EdhO4s/LXU31dmDjfKyuEOFaCiJKX2+4tAuDl1tQkySPqUREmYUL2IGrM0v/bmEXV/7WNDj7JCbgJcXdf/tzyJY6m7hgGBcPbzZl9YMZgtq8rBf0o1KKF/ST9X+5KQjCFA3P2ZakEa8vrrIAmjTl4b1xL8hZHkNu4+JLB7qJUEPXDfBh+xxJsf74XFacUZDwO/0f9p3caGJqeaZERDEHx6B8VHDG3XzR3QDRS0M8f06pNGxJjb7Jb9tL6sDfSGQlvWyf+2ko3aZtAlG5TpeFs4HdxxJr/kiZymWP5X0X0h7XeKY8hEMUFG70hR21LAWM6QEi04k9FRsvPelp3Yg83eBDw6sOjK/Z+FNWpWg0wU9gwu0z7MfD/3drxpYqgMEJ1SNxisrqV69MEzjvOTr91aCF0Vnis8YXPxVQ4v3xSk+doQeEu9Zc38UNs4RUYG+KcYPfIfSIdTF3HfDauM2CvlEXLax6t2UfoxAreWSLS0oMUUDGzd15lYKFxEDOz7T8Kz6NVmm49ICAtn66D8JxYR7umbD22DvD+OrcmC+hkXekgxJpkO3II=
X-Forefront-Antispam-Report: CIP:144.49.247.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(70586007)(26005)(9686003)(52536014)(6916009)(316002)(36860700001)(15650500001)(83380400001)(5660300002)(6506007)(8676002)(7696005)(70206006)(8936002)(356005)(33656002)(2906002)(186003)(81166007)(47076005)(336012)(4186021)(508600001)(82310400003)(55016002)(86362001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 08:02:09.1567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1481fe0-53ff-4337-1040-08d99ab26841
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.17];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB6487
X-Proofpoint-ORIG-GUID: O2yzxP2TxX9HoEyzsDOVePOkpLuYMmAS
X-Proofpoint-GUID: O2yzxP2TxX9HoEyzsDOVePOkpLuYMmAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290045
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

--_000_DM6PR08MB5514480BAD48B0B200646011DC879DM6PR08MB5514namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Actually, I have 2 questions as below:

  1.  I got understood from others on the mailing list, that I don't have t=
o declare EEPROM or temp sensors on the I2C bus node in my dts, and it shou=
ld be fine even I did it at the beginning. So I tried to remove this declar=
ation in dts, then the sensor value I got is fixed, no update. Can someone =
help to take look at why it is?
             Here are some logs that appeared automatically after the syste=
m booted up.  It looks like that entity-manager works fine. And the command=
s I used to check value.
             =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
             [   23.713596] lm75 6-0049: hwmon1: sensor 'tmp75'
             [   23.718894] i2c i2c-6: new_device: Instantiated device tmp7=
5 at 0x49
             [   23.728520] lm75 6-004c: hwmon2: sensor 'tmp75'
             [   23.733779] i2c i2c-6: new_device: Instantiated device tmp7=
5 at 0x4c
             [   23.743707] lm75 6-004d: hwmon3: sensor 'tmp75'
             [   23.749042] i2c i2c-6: new_device: Instantiated device tmp7=
5 at 0x4d

             # busctl introspect xyz.openbmc_project.HwmonTempSensor /xyz/o=
penbmc_project/sensors/temperature/DIMM_P1_EFGH
             xyz.openbmc_project.Sensor.Value                      interfac=
e -         -                                        -
             .MaxValue                                             property=
  d         127                                      emits-change
             .MinValue                                             property=
  d         -128                                     emits-change
             .Unit                                                 property=
  s         "xyz.openbmc_project.Sensor.Value.Uni... emits-change
             .Value                                                property=
  d         40.187                                   emits-change writable

             # cat /sys/bus/i2c/devices/6-004d/hwmon/hwmon3/temp1_input
             40187
             =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  1.  From my understanding, there is "detection daemon" which scans I2C bu=
s looking for EEPROMs with IPMI FRU data. However, I found all devices on t=
he I2C buses would be listed, not only Fru devices, when I used the command=
 below. Is this correct?
             # busctl tree xyz.openbmc_project.FruDevice
             `-/xyz
               `-/xyz/openbmc_project
                 `-/xyz/openbmc_project/FruDevice
                   |-/xyz/openbmc_project/FruDevice/0_80
                   |-/xyz/openbmc_project/FruDevice/0_88
                   |-/xyz/openbmc_project/FruDevice/2_108
                   |-/xyz/openbmc_project/FruDevice/2_112
                   |-/xyz/openbmc_project/FruDevice/2_68
                   |-/xyz/openbmc_project/FruDevice/2_72
                   |-/xyz/openbmc_project/FruDevice/3_22
                   |-/xyz/openbmc_project/FruDevice/3_50
                   |-/xyz/openbmc_project/FruDevice/4_56
                   |-/xyz/openbmc_project/FruDevice/5_48
                   |-/xyz/openbmc_project/FruDevice/5_81
                   |-/xyz/openbmc_project/FruDevice/6_73
                   |-/xyz/openbmc_project/FruDevice/6_76
                   |-/xyz/openbmc_project/FruDevice/6_77
                   |-/xyz/openbmc_project/FruDevice/7_80
                   |-/xyz/openbmc_project/FruDevice/7_88
                   |-/xyz/openbmc_project/FruDevice/8_101
                   `-/xyz/openbmc_project/FruDevice/hudsonbay     <-- this =
is the probe name we define in JSON configuration

Thanks.

Regards,
Chris Chen

Legal Disclaimer :
The information contained in this message may be privileged and confidentia=
l.=20
It is intended to be read only by the individual or entity to whom it is ad=
dressed=20
or by their designee. If the reader of this message is not the intended rec=
ipient,=20
you are on notice that any distribution of this message, in any form,=20
is strictly prohibited. If you have received this message in error,=20
please immediately notify the sender and delete or destroy any copy of this=
 message!

--_000_DM6PR08MB5514480BAD48B0B200646011DC879DM6PR08MB5514namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"PMingLiU",serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:952907307;
	mso-list-template-ids:-1327336270;}
@list l0:level1
	{mso-level-start-at:2;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1
	{mso-list-id:1765688733;
	mso-list-template-ids:-873444200;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Hi everyone,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Actually, I have 2 questions as below:<o:p></o:p></span>=
</p>
</div>
<div>
<ol start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"color:black;mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto;mso-list:l1 level1 lfo1">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif">I got understood=
 from others on the mailing list, that I don't have to declare EEPROM or te=
mp sensors on the I2C bus node in my dts, and it should be fine even I did =
it at the beginning. So I tried to remove this
 declaration in dts, then the sensor value I got is fixed, no update. Can s=
omeone help to take look at why it is?<o:p></o:p></span></li></ol>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Her=
e are some logs that appeared automatically after the system booted up.&nbs=
p;<span style=3D"background:white">&nbsp;It looks like that entity-manager =
works fine. And the commands
 I used to check value.</span><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &=
nbsp; 23.713596] lm75 6-0049: hwmon1: sensor 'tmp75'<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &=
nbsp; 23.718894] i2c i2c-6: new_device: Instantiated device tmp75 at 0x49<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &=
nbsp; 23.728520] lm75 6-004c: hwmon2: sensor 'tmp75'<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &=
nbsp; 23.733779] i2c i2c-6: new_device: Instantiated device tmp75 at 0x4c<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
<span style=3D"background:white">&nbsp;</span>[ &nbsp; 23.743707] lm75 6-00=
4d: hwmon3: sensor 'tmp75'<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
<span style=3D"background:white">&nbsp;</span>[ &nbsp; 23.749042] i2c i2c-6=
: new_device: Instantiated device tmp75 at 0x4d<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; # b=
usctl introspect xyz.openbmc_project.HwmonTempSensor /xyz/openbmc_project/s=
ensors/temperature/DIMM_P1_EFGH<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; xyz=
.openbmc_project.Sensor.Value &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;interface - &nbsp; &nbsp; &nbsp; &nbsp; - &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Ma=
xValue &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp; 127 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;emits-change<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Mi=
nValue &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp; -128 &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; emits-change<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Un=
it &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; property &nbsp;s &nbsp; &nbsp; &nbsp; &nbsp; &quot;xyz=
.openbmc_project.Sensor.Value.Uni... emits-change<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Va=
lue &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:#ED5=
C57">40.187 </span>
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; emits-change writable<o:p></o:p></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; # c=
at /sys/bus/i2c/devices/6-004d/hwmon/hwmon3/temp1_input<o:p></o:p></span></=
p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:#ED5=
C57">40187</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;=
color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:white">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
</span><o:p></o:p></span></p>
</div>
<ol start=3D"2" type=3D"1">
<li class=3D"MsoNormal" style=3D"color:black;mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto;mso-list:l0 level1 lfo2">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif">From my understa=
nding, there is &quot;detection daemon&quot; which scans I2C bus looking fo=
r EEPROMs with IPMI FRU data. However, I found all devices on the I2C buses=
 would be listed, not only Fru devices, when I used the
 command below. Is this correct?<o:p></o:p></span></li></ol>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif"># busctl =
tree xyz.openbmc_project.FruDevice
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">`-/xyz<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; `-=
/xyz/openbmc_project<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; `-/xyz/openbmc_project/FruDevice<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/0_80<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/0_88<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/2_108<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/2_112<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/2_68<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/2_72<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/3_22<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/3_50<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/4_56<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/5_48<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/5_81<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/6_73<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/6_76<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/6_77<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/7_80<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/7_88<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp; &n=
bsp; &nbsp; |-/xyz/openbmc_project/FruDevice/8_101<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp; &nbsp; &nbsp; `-/xyz/openbmc_project/FruDevice/hudsonbay&nbsp;&nbsp;&nb=
sp;&nbsp;
</span><span style=3D"font-family:Wingdings;color:black">&szlig;</span><spa=
n style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"> this is=
 the probe name we define in JSON configuration<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Chris Chen<o:p></o:p></span></p>
</div>
</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_DM6PR08MB5514480BAD48B0B200646011DC879DM6PR08MB5514namp_--
