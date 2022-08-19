Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE21E599907
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 11:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8H8P4Wqzz3cH1
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 19:51:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=Gb7gsGTA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.183.28.62; helo=mx08-002d6701.pphosted.com; envelope-from=prvs=4230f9e824=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=Gb7gsGTA;
	dkim-atps=neutral
Received: from mx08-002d6701.pphosted.com (mx08-002d6701.pphosted.com [185.183.28.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8H7r038Vz3bq5
	for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2022 19:51:03 +1000 (AEST)
Received: from pps.filterd (m0190772.ppops.net [127.0.0.1])
	by mx08-002d6701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IMIbwO000375;
	Fri, 19 Aug 2022 09:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=oN+IPDxqJq0H3Ol+8sRHdcuICqzuQQ3e1qUpvUPxIRE=;
 b=Gb7gsGTA0dIY+QzGszM9H1sr/5ncuLmmTNEKGX0B0x8c8VqYFpmRl1U4Qoezmn3FK84c
 L4LIiL3V39zbbHrzaELofZShsJviQd2hOEe7lw3FAx0Tz9gKTyitUeqv2d3u+37NLh/B
 7Gx84pnHdJf0xVwmyRw45ImX0Dme2iWyoiptZ7d6HYSQ8JTYBwWvonEursFx7FnkU/XE
 Ob3vrbTuTMCxNubymAzm88xOq4nVVj1MqQ/6o1a1UEgJvDNtDaooy9BElwdcM7KQNB40
 Uk7wGU3/L9ypfmp/4SAW0Ib47CYJ9H04t3TXjwwqh8CDk8pVYhqpFrk90UC65lmR9E2W 8w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx08-002d6701.pphosted.com (PPS) with ESMTPS id 3j1nnje9ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 09:50:52 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PTdCGmr+88zKiLssXhXrb94uwRCKzzN2rSRQzYNqlC7hJ7QImR+i8vNlEOWn4N8cw/XheFlOMbF7zK1vdtETHoiuGGltaGQ3qJBZiS6+gxTfMiDOHj6eFy1oKI/bqJ+wUrZ43oZzJ/9rb85yhRuE++OQM8xhCs+wpsYEx1xcSpOPfMKf37BSWqubiuGKkJNqEsylvRxtTLx6OBrm0xKUl5jWUM5P5njUX9r3vtnqf8K0PFZbhKZxtz07KEK6WMJ7Id9vQ/vztu3Cm0JxRbDbvqdbPPRGN0EVFz7KZlvBlyTKDeKcm0XCN/6pxZFdpMzYJnMkaSizDrJrR7P9szKDdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbhcWSpyPeHqXar0+qhvCTlXy+I5QNVeeQgyGYghh+c=;
 b=f1xoSxptYqs/MkO41BfZGxeNpLQBRjKg8QVfhEzitJe3dRM8HrsW5CjA0oIKgjH3Hf3MVKasADsaPbUi7WBvvRJvegVQCYBn3HVFUYstvjj9eI5DMrgqZWDRud4lTmno1uGM9moOUFGznczI7gbspptvbx/s7k2jV6Hm4bOkWrJrIYgdEpFqeI4wvdcUofH10SRo6MeigA8xxhnldxJuTPrJ9m0YSihBaYzenWPVoPJtZPjKuA7u8jgacchU71F6HCfP1qp3gfzlNNTk3hwchbNe6CPgDawrcGCqKOJCKe9/5BZKaAvnIzdRBfRIOiX/eTZ3LevOgs6UKE53qpsEIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.124) smtp.rcpttodomain=amperemail.onmicrosoft.com
 smtp.mailfrom=flex.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=flex.com; dkim=none (message not signed); arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::26)
 by MW5PR08MB8190.namprd08.prod.outlook.com (2603:10b6:303:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 09:50:48 +0000
Received: from CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::82) by MW4P220CA0021.outlook.office365.com
 (2603:10b6:303:115::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18 via Frontend
 Transport; Fri, 19 Aug 2022 09:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.124)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.124 as permitted sender)
 receiver=protection.outlook.com; client-ip=144.49.247.124;
 helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.124) by
 CO1NAM11FT102.mail.protection.outlook.com (10.13.175.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 09:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4EuGt/R1ITwhXnLLAfgpp67ORA9qVsqyJS4oojzmGg9vrbr5o5bJB6iXQSGezVbKUMd2B76B6x+EYjEqK4a7U5fhqoS1eHyIYJ0clYP9VciZhm42Mpq5nl+nN87Wyc5K//ivKFSZ7CDn1CMnuiS8Oeopy61rcGC6sIZfyFepzg6/5jhtrZa8ko9InXr8EWaRJ5qlAkCdVas0GkE4Tx7n7/43AZkG1GSK9eKprGxYlvVOrTmE9sH9BYXU75kwzC5w6po+9ZyrCGIdW19cJsg6NO7namrlzr9sgmptDXq0DDzQMUkxfYZTBB5rKYI82Fiqc6Hm7d9JCrBO34NELa0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbhcWSpyPeHqXar0+qhvCTlXy+I5QNVeeQgyGYghh+c=;
 b=NciHMY2VdzPP9QFTZz8osrFa2grhSPj7MEMSWRFlvWgZ6lb7rOngRGWHXWpn/qYcfFSmY+XHWN2pbFmiYOphQ5/hnchuWGj4a01Do4qT0V0V4XtKP1mkMOLnCwWAjsmpd+pNrQeF5Qinb0+XP2WJ2DvafqbUd9cnKg72tMfE6I7NDSc5ifvhB2d6w8Kv4GZVj2NSbgY+p9gLV9AKy+0qa4Pv9SXjaWribn+0wk87rgIOQQwuyu7d29XWuLYr6nFuyd3DD1Vd1gCYXZjCKoVU233XGtCztZBP0SRUeMdL4g94y6P2PRdW5k6JO7u1W/T1z908lFfCxMuny/modudtlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by BY5PR08MB6423.namprd08.prod.outlook.com (2603:10b6:a03:1e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 09:50:45 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::35ea:61fc:592:8a13]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::35ea:61fc:592:8a13%5]) with mapi id 15.20.5525.011; Fri, 19 Aug 2022
 09:50:45 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>, Jie Yang <jjy@google.com>
Subject: =?big5?B?pl7C0DogUmVhZCBzbWJpb3MyIGZpbGUgZmFpbGVk?=
Thread-Topic: Read smbios2 file failed
Thread-Index:  AQHXqK1mdf9fy4T4VE+gDRFV0Y9YP6uiLzQAgADn6wCAACLvAIABXVwAgAArQ4CAAFRygIAA3/6AgACQuoCAAboeN4IPxzk8
Date: Fri, 19 Aug 2022 09:50:45 +0000
Message-ID:  <DM6PR08MB551466928283CBC3B3D6D68DDC6C9@DM6PR08MB5514.namprd08.prod.outlook.com>
References:  <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
 <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
 <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
In-Reply-To: <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
X-MS-Office365-Filtering-Correlation-Id: f9d6e739-f3c5-4138-5172-08da81c84b4f
x-ms-traffictypediagnostic: 	BY5PR08MB6423:EE_|CO1NAM11FT102:EE_|MW5PR08MB8190:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  eudfEDRzZaZ6h7U5yc9mEcRGMzxaqg+nECKeMH9OZ5vMFR1fug+5Gt/mgsPJm77vH6XxdmvRJhFK9qq0MpUZNCjqpeHKH/9VmmwzqVrziRQFrZUPn7TAA4RD5fN+lvBdb0eHZHMCEGs5GEFNJUkrTV2hyA1lTAe9+PLrGsQkuofTrM8BE8NMiNX4Y/43ky8nP5cm7NXASE6t5MuCobREbNVXJiqCqZM+xblh3kFD0ySTIe9XRJ1MJMXr2Ui/jgBd21zjhnf5V4eB58RyXBQ0hgU3B5ObijkVDNZ1ncdFASxt4uWRSzM2oMz/D651KEDpSeNpBWSyM8XKBiuDUwwrHMzs35KevPF/51Okm3Jl3xbEgSXtQ8xCa4gsEIVEirtgCXBmpf6wMrsKJQTycclmY4L20hO4sK8fJIntIxOc1ahXKgXr5UNne7/0UpWXFiDIUTkvr72iewfs/FbxY1siPWvo4FvtHgOH/KMyLmmz1Hd0Lxx00HSpxJFIOCf29eHP4ceVAUvFRZO9KU/2ikUfi8R70djMruLw1sxtemjPxJ8UMdiWaA4W8YPS69r2pXCGAmKlvU57i+DlfU+RT7GUrWFZ6Drl2CmOEANgPGTZoZgRu1Wla1p0LfW1TqKlov3qXf3bRn364Gf0m6uatW/bPqdysu/3q/EPZvCw35nZQCtMAygl5CFSJLp+ueNnLEwy7tcdS2oj77qhrYw2r18zJVmorHt+Lv3n2JoKZpcxBOXF1Yq9cF7DokKEeqGKAVBkb4GnI3cW0HrjJTjU6W30q3f/7Ik9skhU6wPbgIKhb4142DysAqeWucYX4bkb/2EALhghsw9tj2+3PqdcUWxQxg==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5514.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(296002)(316002)(91956017)(41300700001)(54906003)(966005)(45080400002)(478600001)(110136005)(71200400001)(55016003)(66446008)(66476007)(76116006)(66556008)(66946007)(64756008)(2906002)(4326008)(52536014)(8936002)(5660300002)(122000001)(38100700002)(33656002)(224303003)(86362001)(38070700005)(7696005)(166002)(19627405001)(6506007)(186003)(53546011)(9686003)(83380400001);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_DM6PR08MB551466928283CBC3B3D6D68DDC6C9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6423
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	5df43daa-3040-41bd-2271-08da81c84964
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Bq/IIK+sS13I6aQxDtW3vex9zNWHdB8Jh2cS+1dqY0c5ixC1/zBdPvODjRVxCJITipufo11pCO+phzPW25I/My94Cat3jKGnleOYPR6S6KRtGChzu7lINT3NYR7CU+Dr0gPTxtTAHwWnlQTuYcHouYNcxlzLprIQLcaJOuSOkqFclAmB5Ug3ajhN5dedQy650gnZe/c9rQI2GXM9wTxPaYQUgRc1taftb4leL14h3i9RMhw25uueAgBJoFns4tIBRkrxTJjDWMsOw9xil8zfTqRaZkQvBLDpVgXjxb34FE6FtOnCOJ5qrkvOS9nVaQE6W2jk+0cIbIeJ/sjOpUXr1dt5i5wl6VXVDCmt3TCYFa75tX7fgnMJ7ir0M1BIBQNavtmLz3TTRtr2k+e7jpMQdDAXk02Zyl2Kz8l/vq93rg01jkCaq0TYEAvGEFN8wx/9ssPw5siYD7HnnOPiMC/txCGU1sMfdH2ztoqHHk9VMxZRbC2sB9ejZfiogl/u4nZcOJTSr7ui0ZArDO2+k1P+OAhXiFpFnphvxoLQV2epi1L3VXkLTvSCutJDJIGnVe+joiuQa4Tzu8HloLQ95uzrfpuYaea+glszIkuqsXbz2UlZtdg748fX1qiScCioe9Fg7WP3GTxyflVBexESm7/44h++YQFVDnCidfZEeTZMmIRNhCl7EoqkkKH9L+DrPiy8bRBvpEvxLFPr0sHFUyN7J42NMRBd3BXLysezskZt7a/5eG9Ys9YbKYWRMXcPJeQPzCUa2BGAZeKdyo/71zSf9KXsZfRO2ktoZbW3F1lMV+ANXkhCLufI9CmPF9LdVdIr95hrTIq5bwK5zEOa9H/pl3TphZenKEjalqzGL3N1ue1BAJ1wgSAd2Jym/7tZEpTW
X-Forefront-Antispam-Report: 	CIP:144.49.247.124;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(70206006)(36860700001)(966005)(30864003)(5660300002)(224303003)(110136005)(70586007)(82310400005)(19627405001)(296002)(316002)(33656002)(55016003)(40480700001)(86362001)(4326008)(54906003)(81166007)(40460700003)(166002)(53546011)(82740400003)(41300700001)(9686003)(186003)(336012)(47076005)(83380400001)(2906002)(356005)(45080400002)(6506007)(7696005)(26005)(52536014)(8936002)(478600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 09:50:47.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d6e739-f3c5-4138-5172-08da81c84b4f
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.124];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR08MB8190
X-Proofpoint-GUID: Z3cjhh_ty_Gaw-zs86PjukPkHDl0Ka02
X-Proofpoint-ORIG-GUID: Z3cjhh_ty_Gaw-zs86PjukPkHDl0Ka02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_05,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190039
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>, openbmc <openbmc@lists.ozlabs.org>, Andrei Kartashev <a.kartashev@yadro.com>, CS20 CHLi30 <chli30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB551466928283CBC3B3D6D68DDC6C9DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGVsbG8gZXZlcnlvbmUsDQoNCkkgd291bGQgbGlrZSB0byBzZW5kIHRoZSBTTUJJT1MgdGFibGUg
ZnJvbSBIb3N0IHRvIEJNQyBieSB1c2luZyAic21iaW9zLWlwbWktYmxvYnMiIGludGVyZmFjZS4g
QnV0LCBhZnRlciByZXZpZXdpbmcgYWxsIHlvdXIgZGlzY3Vzc2lvbnMsIEkgc3RpbGwgaGF2ZSBu
byBpZGVhIGhvdyB0byBlbmFibGUgdGhlIGZlYXR1cmUuIENvdWxkIHlvdSBoZWxwIHRvIHNoYXJl
IG1vcmUgZGV0YWlscyB3aXRoIG1lPyBmb3IgZXhhbXBsZSwNCg0KICAxLiAgSG93IHRvIGdlbmVy
YXRlIGEgcmF3IFNNQklPUyB0YWJsZSB3aXRoIE1EUnYyIGhlYWRlcj8gKGxpa2UgdXNpbmcgImRt
aWRlY29kZSAtLWR1bXAtYmluIiBhbmQgd2hhdCBlbHNlPykNCiAgMi4gIEhvdyBkbyBzdGFydCBz
ZW5kaW5nIFNNQklPUyBiaW5hcnkgZmlsZSBhdCBIb3N0LXNpZGU/IChBcyBJIGtub3csIHRoZSBG
VyB1cGRhdGUgbWVjaGFuaXNtIHRocm91Z2ggSVBNSSBibG9iIHdvdWxkIG5lZWQgdG8gYnVpbGQg
YSBob3N0LXRvb2wsIG5hbWVkIGJ1cm4tbXktYm1jLCBvbiB0aGUgSG9zdCBhbmQgdGhlbiBydW4g
dGhlIHRvb2wgdG8gc3RhcnQgaW1hZ2UgZGF0YSB0cmFuc2Zvcm1hdGlvbi4gRG9lcyB0aGUgInNt
Ymlvcy1pcG1pLWJsb2JzIiB3aXRoIHRoZSBzYW1lIG1ldGhvZD8pDQoNCnAucy4gVGhlIE9TIHJ1
bm5pbmcgb24gdGhlIEhvc3QgaXMgVWJ1bnR1IDIwLjA0Lg0KDQpUaGFua3MuDQoNClJlZ2FyZHMs
DQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqxSKXzqsw6
IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytjaHJpcy5jaGVuMz1mbGV4LmNvbUBsaXN0cy5vemxh
YnMub3JnPiClTqrtIFRoYW5nIE5ndXllbiA8dGhhbmdAYW1wZXJlbWFpbC5vbm1pY3Jvc29mdC5j
b20+DQqxSKXzpOm0wTogMjAyMaZ+OaTrMTek6SCkVaTIIDA5OjQwDQqmrKXzqsw6IEppZSBZYW5n
IDxqanlAZ29vZ2xlLmNvbT4NCrDGpbs6IEdhcnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmlybXdh
cmUpIDxtaWtlLmdhcnJldHRAaHBlLmNvbT47IEFuZHJlaSBLYXJ0YXNoZXYgPGEua2FydGFzaGV2
QHlhZHJvLmNvbT47IENTMjAgQ0hMaTMwIDxjaGxpMzBAbnV2b3Rvbi5jb20+OyBvcGVuYm1jIDxv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiBSZTogUmVhZCBzbWJpb3MyIGZpbGUgZmFp
bGVkDQoNCg0KVGhhbmtzIEppYSBmb3IgeW91ciBpbmZvcm1hdGlvbg0KDQpPbiAxNy8wOS8yMDIx
IDA1OjM2LCBKaWUgWWFuZyB3cm90ZToNCkhpLA0KDQpBY3R1YWxseSBJIGFkZGVkIGFuIGlwbWkg
YmxvYiBpbnRlcmZhY2UgdG8gc21iaW9zLW1kciBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9z
bWJpb3MtbWRyL3RyZWUvbWFzdGVyL3NyYy9zbWJpb3MtaXBtaS1ibG9iczxodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvc21iaW9zLW1kci90cmVl
L21hc3Rlci9zcmMvc21iaW9zLWlwbWktYmxvYnNfXzshIUhTbnRsQ2chRXR3aFYxOGk1R2RKLU9j
VUZJUDB1STJlem44bGJCdFRFQWNXUmdQYWQ3RVV1T096T2ZUVnVXNHh0dnBZakNXVSQ+LiBXaXRo
IHRoaXMgaW50ZXJmYWNlIHlvdSBjYW4gc2VuZCB0aGUgc21iaW9zIHRhYmxlcyB0byBCTUMgZWl0
aGVyIHRocm91Z2ggTGludXhCb290IG9yIGhvc3QuIFRoZSBMaW51eEJvb3QgY29kZSBodHRwczov
L2dpdGh1Yi5jb20vdS1yb290L3Utcm9vdC90cmVlL21hc3Rlci9jbWRzL2V4cC9zbWJpb3NfdHJh
bnNmZXI8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS91LXJv
b3QvdS1yb290L3RyZWUvbWFzdGVyL2NtZHMvZXhwL3NtYmlvc190cmFuc2Zlcl9fOyEhSFNudGxD
ZyFFdHdoVjE4aTVHZEotT2NVRklQMHVJMmV6bjhsYkJ0VEVBY1dSZ1BhZDdFVXVPT3pPZlRWdVc0
eHRpV21vTDJYJD4uIFdyaXRpbmcgYW5kIGNvbW1pdHRpbmcgdG8gdGhpcyBibG9iIHdpbGwgZ2Vu
ZXJhdGUgdGhlIE1EUiBoZWFkZXIuDQoNCi1KaWUNCg0KT24gVGh1LCBTZXAgMTYsIDIwMjEgYXQg
NDoxOSBBTSBUaGFuZyBOZ3V5ZW4gPHRoYW5nQGFtcGVyZW1haWwub25taWNyb3NvZnQuY29tPG1h
aWx0bzp0aGFuZ0BhbXBlcmVtYWlsLm9ubWljcm9zb2Z0LmNvbT4+IHdyb3RlOg0KVGhhbmtzIFRp
bSwgTWlrZSBhbmQgQW5kcmVpIGZvciB2ZXJ5IHVzZWZ1bCBpbmZvcm1hdGlvbi4gV2UgY2FuIG1h
a2UgaXQNCndvcmsgYnkgYWRkaW5nIE1EUnYyIGhlYWRlci4NCg0KSSBhbSBmaW5kaW5nIHNvbWUg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIElQTUkgYmxvYnMgY29tbWFuZHMuIEkgY2FuIHNlZQ0Kc29t
ZSBub3RlcyBhdA0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVy
L2Rlc2lnbnMvYmluYXJ5c3RvcmUtdmlhLWJsb2JzLm1kPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2Rlc2lnbnMv
YmluYXJ5c3RvcmUtdmlhLWJsb2JzLm1kX187ISFIU250bENnIUV0d2hWMThpNUdkSi1PY1VGSVAw
dUkyZXpuOGxiQnRURUFjV1JnUGFkN0VVdU9Pek9mVFZ1VzR4dG9hRVZLVXYkPg0KDQpodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1pcG1pLWJsb2JzL2Jsb2IvbWFzdGVyL1JFQURN
RS5tZDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvcGhvc3Bob3ItaXBtaS1ibG9icy9ibG9iL21hc3Rlci9SRUFETUUubWRfXzshIUhTbnRsQ2ch
RXR3aFYxOGk1R2RKLU9jVUZJUDB1STJlem44bGJCdFRFQWNXUmdQYWQ3RVV1T096T2ZUVnVXNHh0
cmYtSWN4RCQ+DQoNCkJ1dCBJIGhhdmUgbm90IGZvdW5kIG1vcmUgZGVzY3JpcHRpb24gYWJvdXQg
dGhlIElQTUkgYmxvYiBjb21tYW5kcyBsaWtlDQpOZXRGbiwgRnVuYywgLi4uIHRoYXQgSSBjYW4g
c2VuZCBhIGZpbGUgZnJvbSBIb3N0IHRvIEJNQy4gRG8geW91IGhhdmUNCmFueSBpbmZvcm1hdGlv
biBhYm91dCB0aGVtPw0KDQoNClRoYW5rcywNCg0KVGhhbmcgUS4gTmd1eWVuDQoNCk9uIDE2LzA5
LzIwMjEgMDk6NDAsIENTMjAgQ0hMaTMwIHdyb3RlOg0KPiBIaSBUaGFuZywNCj4gRGlkIHlvdSB0
cnkgdG8gdXNlIHNtYmlvc19lbnRyeV9wb2ludCBvciBETUkgZnJvbSBob3N0IHRvIEJNQyAvdmFy
L2xpYi9zbWJpb3Mvc21iaW9zMiBmb3IgcGFyc2luZz8NCj4NCj4gWW91IGNhbiByZWZlciB0aGlz
IHN5c2ZzLWZpcm13YXJlLWRtaS10YWJsZXMgYXMgYmVsb3c6DQo+DQo+IFRoZSBmaXJtd2FyZSBw
cm92aWRlcyBETUkgc3RydWN0dXJlcyBhcyBhIHBhY2tlZCBsaXN0IG9mIGRhdGEgcmVmZXJlbmNl
ZCBieSBhIFNNQklPUyB0YWJsZSBlbnRyeSBwb2ludC4NCj4gVGhlIFNNQklPUyBlbnRyeSBwb2lu
dCBjb250YWlucyBnZW5lcmFsIGluZm9ybWF0aW9uLCBsaWtlIFNNQklPUyB2ZXJzaW9uLCBETUkg
dGFibGUgc2l6ZSwgZXRjLg0KPiBUaGUgc3RydWN0dXJlLCBjb250ZW50IGFuZCBzaXplIG9mIFNN
QklPUyBlbnRyeSBwb2ludCBpcyBkZXBlbmRlbnQgb24gU01CSU9TIHZlcnNpb24uDQo+DQo+IFRo
ZSBmb3JtYXQgb2YgU01CSU9TIGVudHJ5IHBvaW50IGFuZCBETUkgc3RydWN0dXJlcyBjYW4gYmUg
cmVhZCBpbiBTTUJJT1Mgc3BlY2lmaWNhdGlvbi4NCj4gVGhlIGRtaS90YWJsZXMgcHJvdmlkZXMg
cmF3IFNNQklPUyBlbnRyeSBwb2ludCBhbmQgRE1JIHRhYmxlcyB0aHJvdWdoIHN5c2ZzIGFzIGFu
IGFsdGVybmF0aXZlIHRvIHV0aWxpdGllcyByZWFkaW5nIHRoZW0gZnJvbSAvZGV2L21lbS4NCj4N
Cj4gVGhlIHJhdyBTTUJJT1MgZW50cnkgcG9pbnQgYW5kIERNSSB0YWJsZSBhcmUgcHJlc2VudGVk
IGFzIGJpbmFyeSBhdHRyaWJ1dGVzIGFuZCBhcmUgYWNjZXNzaWJsZSB2aWE6DQo+IC9zeXMvZmly
bXdhcmUvZG1pL3RhYmxlcy9zbWJpb3NfZW50cnlfcG9pbnQNCj4gL3N5cy9maXJtd2FyZS9kbWkv
dGFibGVzL0RNSQ0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRpbQ0KPg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy1ib3VuY2VzK2No
bGkzMDxtYWlsdG86b3BlbmJtYy1ib3VuY2VzJTJCY2hsaTMwPj1udXZvdG9uLmNvbUBsaXN0cy5v
emxhYnMub3JnPG1haWx0bzpudXZvdG9uLmNvbUBsaXN0cy5vemxhYnMub3JnPl0gT24gQmVoYWxm
IE9mIEdhcnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmlybXdhcmUpDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgU2VwdGVtYmVyIDE1LCAyMDIxIDk6MTkgUE0NCj4gVG86IEFuZHJlaSBLYXJ0YXNoZXYgPGEu
a2FydGFzaGV2QHlhZHJvLmNvbTxtYWlsdG86YS5rYXJ0YXNoZXZAeWFkcm8uY29tPj47IFRoYW5n
IE5ndXllbiA8dGhhbmdAYW1wZXJlbWFpbC5vbm1pY3Jvc29mdC5jb208bWFpbHRvOnRoYW5nQGFt
cGVyZW1haWwub25taWNyb3NvZnQuY29tPj47IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZzxtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPj4NCj4gU3ViamVjdDogUkU6IFJl
YWQgc21iaW9zMiBmaWxlIGZhaWxlZA0KPg0KPiBXZSByZWNlbnRseSBkaWQgdGhlIHNhbWUgdGhp
bmcgYW5kIGdvdCBpdCB3b3JraW5nLiAgQWxsIHlvdSBoYXZlIHRvIGRvIGlzIHRha2UgdGhlIFJB
VyBzbWJpb3MgcmVjb3JkcyBibG9iIGluIGJpbmFyeSBmb3JtIChkZWxpdmVyZWQgYXMgbm90ZWQg
YmVsb3cgaW4gd2hhdGV2ZXIgd2F5IHlvdSBjaG9vc2UpIGFuZCBwcmVwZW5kIGEgc3BlY2lmaWMg
aGVhZGVyOiAgaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZzbWJpb3MtbWRyJTJGYmxv
YiUyRjMzYzk0OGE0NzNiZDI3M2ZlYTBjZmY4MmQ0Yzk5YjcwYjc3ODRiZTYlMkZpbmNsdWRlJTJG
c21iaW9zX21kcnYyLmhwcCUyM0wxMTQmYW1wO2RhdGE9MDQlN0MwMSU3Q2NobGkzMCU0MG51dm90
b24uY29tJTdDODFhNGJkMjllNDkwNGJmNGQ4NDYwOGQ5Nzg1MTBiOTIlN0NhM2YyNDkzMWQ0MDM0
YjRhOTRmMTdkODNhYzYzOGUwNyU3QzAlN0MwJTdDNjM3NjczNTI2OTU0NTUyNzQyJTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqbyBpVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1vUXdjb3pzU29HbGdT
Rnd6dFBGVjNGQW9QcFJaR1lvWjdwYzAlMkJ4RGkxTUElM0QmYW1wO3Jlc2VydmVkPTA8aHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyozQSoyRioyRmdpdGh1Yi5jb20qMkZvcGVuYm1jKjJGc21i
aW9zLW1kcioyRmJsb2IqMkYzM2M5NDhhNDczYmQyNzNmZWEwY2ZmODJkNGM5OWI3MGI3Nzg0YmU2
KjJGaW5jbHVkZSoyRnNtYmlvc19tZHJ2Mi5ocHAqMjNMMTE0JmFtcDtkYXRhPTA0KjdDMDEqN0Nj
aGxpMzAqNDBudXZvdG9uLmNvbSo3QzgxYTRiZDI5ZTQ5MDRiZjRkODQ2MDhkOTc4NTEwYjkyKjdD
YTNmMjQ5MzFkNDAzNGI0YTk0ZjE3ZDgzYWM2MzhlMDcqN0MwKjdDMCo3QzYzNzY3MzUyNjk1NDU1
Mjc0Mio3Q1Vua25vd24qN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAqM0QqN0MxMDAwJmFtcDtzZGF0YT1v
UXdjb3pzU29HbGdTRnd6dFBGVjNGQW9QcFJaR1lvWjdwYzAqMkJ4RGkxTUEqM0QmYW1wO3Jlc2Vy
dmVkPTBfXztKU1VsSlNVbEpTVWxKU1VsSlNVbEpTVWxKU1VsSlNVbCEhSFNudGxDZyFFdHdoVjE4
aTVHZEotT2NVRklQMHVJMmV6bjhsYkJ0VEVBY1dSZ1BhZDdFVXVPT3pPZlRWdVc0eHRzZzhHeF95
JD4NCj4NCj4gSXQgaXMgYSBsaXR0bGUgYml0IGZyYWdpbGUgYXMgaXQgaW50cm9kdWNlcyBhIGRl
cGVuZGVuY3kgb24gdGhlIGZpbGUgZG93bmxvYWQgbG9naWMgdG8gd3JpdGUgYSBub24tc3RhbmRh
cmQgaGVhZGVyIGRlZmluZWQgaW4gYW5vdGhlciBzZXJ2aWNlIHRoYXQgY291bGQgcG90ZW50aWFs
bHkgY2hhbmdlLg0KPg0KPiBNaWtlDQo+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
Pj4gRnJvbTogb3BlbmJtYyA8b3BlbmJtYy0NCj4+IGJvdW5jZXMrbWlrZS5nYXJyZXR0PWhwZS5j
b21AbGlzdHMub3psYWJzLm9yZzxtYWlsdG86aHBlLmNvbUBsaXN0cy5vemxhYnMub3JnPj4gT24g
QmVoYWxmIE9mIEFuZHJlaQ0KPj4gS2FydGFzaGV2DQo+PiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciAxNSwgMjAyMSAzOjE3IEFNDQo+PiBUbzogVGhhbmcgTmd1eWVuIDx0aGFuZ0BhbXBlcmVt
YWlsLm9ubWljcm9zb2Z0LmNvbTxtYWlsdG86dGhhbmdAYW1wZXJlbWFpbC5vbm1pY3Jvc29mdC5j
b20+Pjsgb3BlbmJtYw0KPj4gPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnPj4NCj4+IFN1YmplY3Q6IFJlOiBSZWFkIHNtYmlvczIgZmlsZSBm
YWlsZWQNCj4+DQo+PiBJIGRvbid0IGtub3cgd2hhdCBpcyBmb3JtYXQgb2YgImRtaWRlY29kZSAt
LWR1bXAtYmluIiwgYnV0IGlmIGl0IGp1c3QNCj4+IHJhdyBkdW1wIG9mIHNtYmlvcyB0aGVuIHlv
dSBvbmx5IG5lZWQgdG8gYWRkIG1kciBoZWFkZXIuDQo+Pg0KPj4gU2VlIGFuc3dlciBmb3IgdGhl
IHNhbWUgcXVlc3Rpb24gaGVyZToNCj4+IElOVkFMSUQgVVJJIFJFTU9WRUQNCj4+IDAyMS1KdWx5
LzAyNjg4Mi5odG1sX187ISFOcHhSITJ3MEZrUHMyS3lhQjZYT3ZCOGV0NTJiV0txQU1MSW1tTC0N
Cj4+IGlVazlBX3paYko4V0xoTWVYZHZSQXAtcGN4dDhRJA0KPj4NCj4+IE9uIFdlZCwgMjAyMS0w
OS0xNSBhdCAxMjo0MSArMDcwMCwgVGhhbmcgTmd1eWVuIHdyb3RlOg0KPj4+IEhpIEFuZHJlaSwN
Cj4+Pg0KPj4+IEkgc2VlIG91dHB1dCBvZiAiZG1pZGVjb2RlIC0tZHVtcC1iaW4iIGZvbGxvd3Mg
U01CSU9TIHNwZWNpZmljYXRpb24uDQo+Pj4gQXMNCj4+PiB0aGUgZGF0YSBmb3Igc21iaW9zLW1k
ciBkb2VzIG5vdCBmb2xsb3cgdGhpcywgZG8geW91IGtub3cgYWJvdXQgdGhlDQo+Pj4gZG9jdW1l
bnQgb3IgYW55IGluZm9ybWF0aW9uIEkgY2FuIHJlZmVyZW5jZSB0byBwcmVwYXJlIGRhdGEgdG8g
c2VuZA0KPj4+IHRvIEJNQz8/DQo+Pj4NCj4+Pg0KPj4+IEJlc3QgUmVnYXJkcywNCj4+Pg0KPj4+
IFRoYW5nIFEuIE5ndXllbg0KPj4+DQo+Pj4gT24gMTQvMDkvMjAyMSAxNTo1MSwgQW5kcmVpIEth
cnRhc2hldiB3cm90ZToNCj4+Pj4gTm8sIGl0IGlzIG5vdCBzYW1lIGFzICJkbWlkZWNvZGUgLS1k
dW1wLWJpbiIuDQo+Pj4+DQo+Pj4+IE9uIFR1ZSwgMjAyMS0wOS0xNCBhdCAxMzo0NiArMDcwMCwg
VGhhbmcgTmd1eWVuIHdyb3RlOg0KPj4+Pj4gT24gMTMvMDkvMjAyMSAyMzo1NiwgQW5kcmVpIEth
cnRhc2hldiB3cm90ZToNCj4+Pj4+PiBZb3UgbmVlZCB0byBzb21laG93IGRlbGl2ZXIgc21iaW9z
IGRhdGEgaW1hZ2UgdG8gQk1DLiBUaGlzDQo+Pj4+Pj4gbWVhbnMsIHlvdXIgQklPUyBzaG91bGQg
aW1wbGVtZW50YXQgc29tZSBsb2dpYyB0byB0cmFuc2Zlcg0KPj4+Pj4+IHRoaXMgZGF0YS4NCj4+
Pj4+PiBGb3IgQk1DIHNpZGUgc2VlIGV4YW1wbGUgaGVyZToNCj4+Pj4+PiBodHRwczovL2FwYzAx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMjxodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzKjNBKjJfXztKU1UhIUhTbnRsQ2chRXR3aFYxOGk1R2RKLU9j
VUZJUDB1STJlem44bGJCdFRFQWNXUmdQYWQ3RVV1T096T2ZUVnVXNHh0Z0dEbFJxaSQ+DQo+Pj4+
Pj4gRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGaW50ZWwtaXBtaS0mYW1wO2RhdGE9MDQlN0Mw
MSU3Q2NobGkNCj4+Pj4+PiAzMCU0MG51dm90b24uY29tPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwOi8vNDBudXZvdG9uLmNvbV9fOyEhSFNudGxDZyFFdHdoVjE4aTVHZEotT2NVRklQ
MHVJMmV6bjhsYkJ0VEVBY1dSZ1BhZDdFVXVPT3pPZlRWdVc0eHRoV3NlbUhyJD4lN0M4MWE0YmQy
OWU0OTA0YmY0ZDg0NjA4ZDk3ODUxMGI5MiU3Q2EzZjI0OTMxDQo+Pj4+Pj4gZDQwMzRiNGE5NGYx
N2Q4M2FjNjM4ZTA3JTdDMCU3QzAlN0M2Mzc2NzM1MjY5NTQ1NTI3NDIlN0NVbmtub3cNCj4+Pj4+
PiBuJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJaw0KPj4+Pj4+IDFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9Y0c2
Wlp6T1NYa3VVdGNRdXVveW1zUmRQDQo+Pj4+Pj4gcDI0bUlOYSUyRmhDeSUyQlloZSUyRk5tayUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KPj4gb2VtL2Jsb2IvbWFzdGVyL3NyYy9zbWJpb3MNCj4+Pj4+PiBt
ZHJ2MmhhbmRsZXIuY3BwDQo+Pj4+PiBIaSBBbmRyZWksDQo+Pj4+Pg0KPj4+Pj4gV2hhdCBpcyB0
aGUgZm9ybWF0IG9mIHNtYmlvcyBkYXRhIHRvIHRyYW5zZmVyIHRvIEJNQz8gSXMgaXQgdGhlDQo+
Pj4+PiBzYW1lIGNvbnRlbnQgb2YgImRtaWRlY29kZSAtLWR1bXAtYmluIiBjb21tYW5kIGZyb20g
SG9zdCBMaW51eD8NCj4+IG9yDQo+Pj4+PiBhbnl0aGluZyBzcGVjaWFsIGluIGZvcm1hdHRpbmcg
dGhlIGNvbnRlbnQgdG8gc2VuZD8NCj4+Pj4+DQo+Pj4+Pj4gT24gTW9uLCAyMDIxLTA5LTEzIGF0
IDE3OjQwICswMzAwLCBBbGV4YW5kZXIgUmFpaCB3cm90ZToNCj4+Pj4+Pj4gSGkgZ3V5cywgSSBh
bSBiZWdpbm5lciBpbiBvcGVuYm1jIEkgYnVpbGQgb3BlbmJtYyB3aXRoDQo+Pj4+Pj4+IHNtYmlv
cy1tZHIgcmVwb3NpdG9yeSBhbmQgSSBoYXZlIGVycm9yOg0KPj4+Pj4+Pg0KPj4+Pj4+PiBSZWFk
IGRhdGEgZnJvbSBmbGFzaCBlcnJvciAtIE9wZW4gTURSVjIgdGFibGUgZmlsZSBmYWlsdXJlDQo+
Pj4+Pj4+DQo+Pj4+Pj4+IFRoZXJlIGlzbnQgZmlsZSBpbiAvdmFyL2xpYi9zbWJpb3Mvc21iaW9z
Mg0KPj4+Pj4+Pg0KPj4+Pj4+PiBIb3cgSSBjYW4gcmVzb2x2ZSB0aGlzIHByb2JsZW0/DQo+Pj4+
Pj4+IEhlbHAgbWUgcGxlYXNlISEhDQo+Pg0KPj4gLS0NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEFu
ZHJlaSBLYXJ0YXNoZXYNCj4+DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ICAgVGhlIHByaXZpbGVnZWQgY29u
ZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVk
IGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdp
bmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGlu
ZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5
IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRo
ZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0
IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIg
Y29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55
IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24g
aXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWls
IGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUg
ZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uDQoKTGVnYWwg
RGlzY2xhaW1lciA6ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlIG1h
eSBiZSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwuIApJdCBpcyBpbnRlbmRlZCB0byBiZSBy
ZWFkIG9ubHkgYnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQgaXMgYWRkcmVz
c2VkIApvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3NhZ2Ug
aXMgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIAp5b3UgYXJlIG9uIG5vdGljZSB0aGF0IGFu
eSBkaXN0cmlidXRpb24gb2YgdGhpcyBtZXNzYWdlLCBpbiBhbnkgZm9ybSwgCmlzIHN0cmljdGx5
IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBpbiBlcnJvciwg
CnBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIG9yIGRlc3Ry
b3kgYW55IGNvcHkgb2YgdGhpcyBtZXNzYWdlIQo=

--_000_DM6PR08MB551466928283CBC3B3D6D68DDC6C9DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I would like to send the SMBIOS table from Host to BMC by using &quot;smbio=
s-ipmi-blobs&quot; interface. But, after reviewing all your discussions, I =
still have no idea how to enable the feature. Could you help to share more =
details with me? for example,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ol>
<li><span>How to generate a raw SMBIOS table with MDRv2 header? (like using=
 &quot;dmidecode --dump-bin&quot; and what else?)</span></li><li>How do sta=
rt sending SMBIOS binary file at Host-side? (As I know, the FW update mecha=
nism through IPMI blob would need to build a host-tool, named burn-my-bmc, =
on the Host and then run the tool to start image data transformation. Does =
the &quot;smbios-ipmi-blobs&quot;
 with the same method?)<span style=3D"text-align:start;background-color:rgb=
(255, 255, 255);display:inline !important"><span style=3D"background-color:=
rgb(255, 255, 255);display:inline !important"></span></span></li></ol>
<div><br>
</div>
<div>p.s. The OS running on the Host is Ubuntu 20.04.</div>
<div><br>
</div>
<div>Thanks.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen</div>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" class=3D"elementToProof"><font face=
=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>=B1H=
=A5=F3=AA=CC:</b> openbmc &lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.=
ozlabs.org&gt; =A5N=AA=ED Thang Nguyen &lt;thang@amperemail.onmicrosoft.com=
&gt;<br>
</font></div>
<div dir=3D"ltr"><font face=3D"Calibri, sans-serif" color=3D"#000000" style=
=3D"font-size:11pt"><b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB17=A4=E9 =
=A4U=A4=C8 09:40<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Jie Yang &lt;jjy@google.com&gt;<br>
<b>=B0=C6=A5=BB:</b> Garrett, Mike (HPE Server Firmware) &lt;mike.garrett@h=
pe.com&gt;; Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; CS20 CHLi30 &lt=
;chli30@nuvoton.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: Read smbios2 file failed</font>
<div>&nbsp;</div>
</div>
<div>
<p>Thanks Jia for your information<br>
</p>
<div class=3D"x_moz-cite-prefix">On 17/09/2021 05:36, Jie Yang wrote:<br>
</div>
<blockquote type=3D"cite">
<div dir=3D"ltr">Hi,
<div><br>
</div>
<div>Actually I added an ipmi blob interface to smbios-mdr<a href=3D"https:=
//urldefense.com/v3/__https://github.com/openbmc/smbios-mdr/tree/master/src=
/smbios-ipmi-blobs__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EU=
uOOzOfTVuW4xtvpYjCWU$" data-auth=3D"NotApplicable">&nbsp;https://github.com=
/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs</a>.
 With this interface you can send the smbios tables to BMC either through L=
inuxBoot or host. The LinuxBoot code&nbsp;<a href=3D"https://urldefense.com=
/v3/__https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer=
__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtiWmoL=
2X$" data-auth=3D"NotApplicable">https://github.com/u-root/u-root/tree/mast=
er/cmds/exp/smbios_transfer</a>.
 Writing and committing to this blob will generate the MDR header.</div>
<div><br>
</div>
<div>-Jie</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Sep 16, 2021 at 4:19 AM Tha=
ng Nguyen &lt;<a href=3D"mailto:thang@amperemail.onmicrosoft.com" data-auth=
=3D"NotApplicable">thang@amperemail.onmicrosoft.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex; border-left:1px solid rgb(204,204,204); padding-left:1ex">
Thanks Tim, Mike and Andrei for very useful information. We can make it <br>
work by adding MDRv2 header.<br>
<br>
I am finding some information about the IPMI blobs commands. I can see <br>
some notes at<br>
<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/docs/blob=
/master/designs/binarystore-via-blobs.md__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI=
2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtoaEVKUv$" data-auth=3D"NotApplicable">ht=
tps://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md<=
/a><br>
<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
ipmi-blobs/blob/master/README.md__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbB=
tTEAcWRgPad7EUuOOzOfTVuW4xtrf-IcxD$" data-auth=3D"NotApplicable">https://gi=
thub.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md</a><br>
<br>
But I have not found more description about the IPMI blob commands like <br>
NetFn, Func, ... that I can send a file from Host to BMC. Do you have <br>
any information about them?<br>
<br>
<br>
Thanks,<br>
<br>
Thang Q. Nguyen<br>
<br>
On 16/09/2021 09:40, CS20 CHLi30 wrote:<br>
&gt; Hi Thang,<br>
&gt; Did you try to use smbios_entry_point or DMI from host to BMC /var/lib=
/smbios/smbios2 for parsing?<br>
&gt;<br>
&gt; You can refer this sysfs-firmware-dmi-tables as below:<br>
&gt;<br>
&gt; The firmware provides DMI structures as a packed list of data referenc=
ed by a SMBIOS table entry point.<br>
&gt; The SMBIOS entry point contains general information, like SMBIOS versi=
on, DMI table size, etc.<br>
&gt; The structure, content and size of SMBIOS entry point is dependent on =
SMBIOS version.<br>
&gt;<br>
&gt; The format of SMBIOS entry point and DMI structures can be read in SMB=
IOS specification.<br>
&gt; The dmi/tables provides raw SMBIOS entry point and DMI tables through =
sysfs as an alternative to utilities reading them from /dev/mem.<br>
&gt;<br>
&gt; The raw SMBIOS entry point and DMI table are presented as binary attri=
butes and are accessible via:<br>
&gt; /sys/firmware/dmi/tables/smbios_entry_point<br>
&gt; /sys/firmware/dmi/tables/DMI<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Tim<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bchli30" data=
-auth=3D"NotApplicable">openbmc-bounces+chli30</a>=3D<a href=3D"mailto:nuvo=
ton.com@lists.ozlabs.org" data-auth=3D"NotApplicable">nuvoton.com@lists.ozl=
abs.org</a>] On Behalf Of Garrett, Mike (HPE
 Server Firmware)<br>
&gt; Sent: Wednesday, September 15, 2021 9:19 PM<br>
&gt; To: Andrei Kartashev &lt;<a href=3D"mailto:a.kartashev@yadro.com" data=
-auth=3D"NotApplicable">a.kartashev@yadro.com</a>&gt;; Thang Nguyen &lt;<a =
href=3D"mailto:thang@amperemail.onmicrosoft.com" data-auth=3D"NotApplicable=
">thang@amperemail.onmicrosoft.com</a>&gt;; openbmc &lt;<a href=3D"mailto:o=
penbmc@lists.ozlabs.org" data-auth=3D"NotApplicable">openbmc@lists.ozlabs.o=
rg</a>&gt;<br>
&gt; Subject: RE: Read smbios2 file failed<br>
&gt;<br>
&gt; We recently did the same thing and got it working.&nbsp; All you have =
to do is take the RAW smbios records blob in binary form (delivered as note=
d below in whatever way you choose) and prepend a specific header:&nbsp;
<a href=3D"https://urldefense.com/v3/__https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F=
33c948a473bd273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L11=
4&amp;amp;data=3D04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d97=
8510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CU=
nknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0*3D*7C1000&amp;amp;sdata=3DoQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0*2B=
xDi1MA*3D&amp;amp;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUl!!HSntlCg!=
EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtsg8Gx_y$" data-aut=
h=3D"NotApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be=
6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;amp;data=3D04%7C01%7Cchli30%40nuv=
oton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638=
e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjo
 iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoQwcozsSoGl=
gSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; It is a little bit fragile as it introduces a dependency on the file d=
ownload logic to write a non-standard header defined in another service tha=
t could potentially change.<br>
&gt;<br>
&gt; Mike<br>
&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: openbmc &lt;openbmc-<br>
&gt;&gt; bounces+mike.garrett=3D<a href=3D"mailto:hpe.com@lists.ozlabs.org"=
 data-auth=3D"NotApplicable">hpe.com@lists.ozlabs.org</a>&gt; On Behalf Of =
Andrei<br>
&gt;&gt; Kartashev<br>
&gt;&gt; Sent: Wednesday, September 15, 2021 3:17 AM<br>
&gt;&gt; To: Thang Nguyen &lt;<a href=3D"mailto:thang@amperemail.onmicrosof=
t.com" data-auth=3D"NotApplicable">thang@amperemail.onmicrosoft.com</a>&gt;=
; openbmc<br>
&gt;&gt; &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" data-auth=3D"NotAp=
plicable">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt;&gt; Subject: Re: Read smbios2 file failed<br>
&gt;&gt;<br>
&gt;&gt; I don't know what is format of &quot;dmidecode --dump-bin&quot;, b=
ut if it just<br>
&gt;&gt; raw dump of smbios then you only need to add mdr header.<br>
&gt;&gt;<br>
&gt;&gt; See answer for the same question here:<br>
&gt;&gt; INVALID URI REMOVED<br>
&gt;&gt; 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-<b=
r>
&gt;&gt; iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:<br>
&gt;&gt;&gt; Hi Andrei,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I see output of &quot;dmidecode --dump-bin&quot; follows SMBIO=
S specification.<br>
&gt;&gt;&gt; As<br>
&gt;&gt;&gt; the data for smbios-mdr does not follow this, do you know abou=
t the<br>
&gt;&gt;&gt; document or any information I can reference to prepare data to=
 send<br>
&gt;&gt;&gt; to BMC??<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thang Q. Nguyen<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 14/09/2021 15:51, Andrei Kartashev wrote:<br>
&gt;&gt;&gt;&gt; No, it is not same as &quot;dmidecode --dump-bin&quot;.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 13/09/2021 23:56, Andrei Kartashev wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; You need to somehow deliver smbios data image to B=
MC. This<br>
&gt;&gt;&gt;&gt;&gt;&gt; means, your BIOS should implementat some logic to =
transfer<br>
&gt;&gt;&gt;&gt;&gt;&gt; this data.<br>
&gt;&gt;&gt;&gt;&gt;&gt; For BMC side see example here:<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://urldefense.com/v3/__https://apc=
01.safelinks.protection.outlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!EtwhV1=
8i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOfTVuW4xtgGDlRqi$" data-auth=3D"N=
otApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;amp;dat=
a=3D04%7C01%7Cchli<br>
&gt;&gt;&gt;&gt;&gt;&gt; 30%<a href=3D"https://urldefense.com/v3/__http://4=
0nuvoton.com__;!!HSntlCg!EtwhV18i5GdJ-OcUFIP0uI2ezn8lbBtTEAcWRgPad7EUuOOzOf=
TVuW4xthWsemHr$" data-auth=3D"NotApplicable">40nuvoton.com</a>%7C81a4bd29e4=
904bf4d84608d978510b92%7Ca3f24931<br>
&gt;&gt;&gt;&gt;&gt;&gt; d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552=
742%7CUnknow<br>
&gt;&gt;&gt;&gt;&gt;&gt; n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik<br>
&gt;&gt;&gt;&gt;&gt;&gt; 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DcG6ZZz=
OSXkuUtcQuuoymsRdP<br>
&gt;&gt;&gt;&gt;&gt;&gt; p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;amp;reserved=3D0<=
br>
&gt;&gt; oem/blob/master/src/smbios<br>
&gt;&gt;&gt;&gt;&gt;&gt; mdrv2handler.cpp<br>
&gt;&gt;&gt;&gt;&gt; Hi Andrei,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; What is the format of smbios data to transfer to BMC? =
Is it the<br>
&gt;&gt;&gt;&gt;&gt; same content of &quot;dmidecode --dump-bin&quot; comma=
nd from Host Linux?<br>
&gt;&gt; or<br>
&gt;&gt;&gt;&gt;&gt; anything special in formatting the content to send?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi guys, I am beginner in openbmc I build open=
bmc with<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; smbios-mdr repository and I have error:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Read data from flash error - Open MDRV2 table =
file failure<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; There isnt file in /var/lib/smbios/smbios2<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; How I can resolve this problem?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Help me please!!!<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Andrei Kartashev<br>
&gt;&gt;<br>
&gt; ________________________________<br>
&gt; ________________________________<br>
&gt;&nbsp; &nbsp;The privileged confidential information contained in this =
email is intended for use only by the addressees as indicated by the origin=
al sender of this email. If you are not the addressee indicated in this ema=
il or are not responsible for delivery of the
 email to such a person, please kindly reply to the sender indicating this =
fact and delete all copies of it from your computer and network server imme=
diately. Your cooperation is highly appreciated. It is advised that any una=
uthorized use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<br>
</blockquote>
</div>
</blockquote>
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

--_000_DM6PR08MB551466928283CBC3B3D6D68DDC6C9DM6PR08MB5514namp_--
