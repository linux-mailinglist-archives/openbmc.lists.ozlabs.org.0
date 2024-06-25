Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA9916E4E
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2024 18:43:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mbMD6mzc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7rHp643Kz3fm9
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 02:43:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mbMD6mzc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7rHF0WGRz3f0P
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 02:43:04 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PFSbuE006630
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2024 16:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:subject:date:message-id:content-type:mime-version; s=pp1;
	 bh=fMRaPYwECSXDsvJthfTrU6PTU4lyts1uvqBbwMKIsmk=; b=mbMD6mzcaNGl
	O+qZ65QZwDHj23m/x52njljXzdubfd4AoDQfq2eApDpDVmYl1AGerj9580+S0ro6
	Djolt9HHz8y2SkCeIgdpSLsAy2/cT0xmz8gPZVn982SbUyfrct6eyh7isvq73Qtw
	xewJE/sBYQSfnN4+s6P4fgnbJh0SzuQXmOY43RZCh2kW/202F4vNWEIk6FdLq4MM
	WLAf+TK4VjgulBK/TV1AVESiF56+HxaiK8oDX8BMFS8PQyi8aVnZWori3KvWQc6g
	w1B7QOySMZ8FU200wTBrVq5qn81G48UqeuETk6hPOPLJ5zqdBJQ6GDBhjltHkjL1
	MeHh7W2eiA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4000jh0667-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2024 16:43:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WG/lh9vQDtORK1GyCUkDTlwmK7StcUSykB/7jQQuVwqUnfMv2/LCam8vDugGvzMcemk2fj8WmX1xqvSkUiSTecXJxISboumnAfLMD3ufnLPOJfGMz9glPvbTMqSfVNQ4hMT1XKRXMkA9/8JWV19Rzq/GSxkMgNitHANhmGlPf8vLc5NT3c252LXecbd6w8dREB8FoP3oJJGLhwWq94OwpVmoKb/Ap921cUVb2iqBtVa7QxcPZeZrdKEMcL+8mszC6csXsB7u5ZDP8HyBBGKEb8lu4Otf3mTV9c3o2BPMcRAqR3/oa+FZim4uWxyn2HbQiEyJlNnK0DaOHnxRXo7/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMRaPYwECSXDsvJthfTrU6PTU4lyts1uvqBbwMKIsmk=;
 b=ItO2FPLWUPQJC2v0HG2/pgzQ4tFjaqsCEWA5Dsyzle1B+fUCmPfw5xW8RlSIMllJIaci3oa0jhFh7RcWhbZsmKJ+LNwDqCHn1AfH8T+ncZp3Zkmo2sO09QBxZklFXPLscO8VVm8octKT/I9Txelz/f41OO4xs/junC3cEaAO5THty+IH1ALk9gZ14KBz80A9c06sPh1yv42CAScjbjH6J98HHrpfnh/ZvJXYK1WWf4hi8VvvkmIV7af9QkZapWZfDp4KCAt6aAQqXfZi/i/lTaAHu1ncDayTMij1MtpSgm9BsYsc9o2+QwKFFrn1HeyLNjAU0bUwb4RZdqTkbH+vfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from CO1PR15MB4970.namprd15.prod.outlook.com (2603:10b6:303:e5::10)
 by CH3PR15MB6499.namprd15.prod.outlook.com (2603:10b6:610:1b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 16:42:59 +0000
Received: from CO1PR15MB4970.namprd15.prod.outlook.com
 ([fe80::87bc:869b:7c0f:2e75]) by CO1PR15MB4970.namprd15.prod.outlook.com
 ([fe80::87bc:869b:7c0f:2e75%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 16:42:58 +0000
From: GEORGE KEISHING <gkeishin@in.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Test Robot Framework 7.0: changes in the repository and new
 branch check point for older version
Thread-Topic: OpenBMC Test Robot Framework 7.0: changes in the repository and
 new branch check point for older version
Thread-Index: AdrHHBFGtjE/cjnkQ5uxb9+vsqdK9Q==
Date: Tue, 25 Jun 2024 16:42:58 +0000
Message-ID:  <CO1PR15MB49707806F571F1F2E0625BB8E6D52@CO1PR15MB4970.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR15MB4970:EE_|CH3PR15MB6499:EE_
x-ms-office365-filtering-correlation-id: 2188cba2-0f02-4900-e95a-08dc9535def4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info:  =?us-ascii?Q?pkW0qFGc+Z4XMWIKjchHxsCtzkrCcAt6DjPDcD+NXgHPoW1QC7KG8T982qN9?=
 =?us-ascii?Q?sSaRvOgtBsFXDRGvS9qKKEPs1eywCsL1hXoIIvQpwpSGoHpkXnHeKiSv3X36?=
 =?us-ascii?Q?vi2qFgmm15XmpP96nauimw8/veqQx3/YCjjFeBfzszvOAsRDcuPBvc4TV0vM?=
 =?us-ascii?Q?FcxbRwO9SaSzmzN748i4vWK2Jz+mFQnnFlnqNTgD9i8a55IagtbK8jvJey39?=
 =?us-ascii?Q?hFHgf9C9WLRJu/N/5dWQmss5ZqUsWYNrz5zHZtnU2fwFRvP6piD3djZpX8MY?=
 =?us-ascii?Q?yNZPHbVgqJ4C8KpRBFyrmnlbnOm4x8WNn24TLQDCP+odvV1su3dRUL2Y5tEa?=
 =?us-ascii?Q?HBdMq4hmTHl4B0laqlJ6l+SNncnSBRRQSp+8DRqA5abFIfX/0Fs9dFrEaWN/?=
 =?us-ascii?Q?vJi7DK9E1dKyoGZmoJLIOAUwl/6ClMpOjb/ohqPD9DRBo69zEqJbbIEaf+cF?=
 =?us-ascii?Q?VSJC+4rp7rHtFsocVC2HSxbuSSbhPAS7jhfD7h5wRa6oGHnztCHsmptKYH4e?=
 =?us-ascii?Q?VMuYrfBfFlnxIIW7VVLJZvWMUBRZrB9FMtBiPZayb/k2iSN8Z+WkPlSMTUNI?=
 =?us-ascii?Q?ZJe5Yg8lLWCwZoOYy11TXwg5DHPWDedqRWlWwG8s2S2VMMQiz3xtQYiVQMjs?=
 =?us-ascii?Q?I2Y+a5v4besFV9ViywO3gA6GpETPfM2L8j4LsP+P8zI+YVPrRmS0FtvlKAP3?=
 =?us-ascii?Q?KCtOouNZzbUGId3uhVVZiiFKwpQJQ+NfmSj8fMT3wFku/2erRMozIbEi4XaF?=
 =?us-ascii?Q?V49W4rDcMZDM9gPLDEpChBDGiQ/R0dS0cpX5uo1na9wj+vPsGUbF5iw8DygN?=
 =?us-ascii?Q?kXZElaRJvGQWSV3g4MYCZiFx0B+Wr4RT9QHsrh/gST1WSuTJ3RgDIHDVjDka?=
 =?us-ascii?Q?7p/pmLuqi+qaz9BdZ/k0/k6bARJ7AaaEGim+OXmH4LHVsYB3TAW6eQqZfuWg?=
 =?us-ascii?Q?zPkjvia6/Egcm93tbZYVV9R0zLrHkYkPnx8MFt2+6DwzO1G2aP6CUYJsSJcI?=
 =?us-ascii?Q?XBXRImfRKMQuR95VZBW64FEeH/XjtDkw03bxzLiFTFmk9VNtQ+8wKqqRE766?=
 =?us-ascii?Q?PhV16v70DrwI19y0la9BLGeL3Iae1kNmWKxgwO6BynHcOO+mZLXxbjYDc8f5?=
 =?us-ascii?Q?pKEMp7mT3zc4YrR2m50j8DF9NFJoIrWKvWC1j7rLmbNQL9hi7qnzHzeLPSHn?=
 =?us-ascii?Q?3LIW/gSHzFrS97iEaG1jnJvOa64tMUbrP3uNnf2r5PJRKtpwezAp8gXS8ffc?=
 =?us-ascii?Q?AVHR09T7cbdKVAo0Yn56dCNvB4uGLgo65WjapqV/Dte405Th/sNV7R1/lD5I?=
 =?us-ascii?Q?+nFqdFSGtrwrfWbjwt7SDpj+?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR15MB4970.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?HqzGHTXKu47iD+ZXSrvC9XoW7sDsn3L3kfcL6A0qzNXQGzkSseiWyHCxsBwd?=
 =?us-ascii?Q?0+6MO79D8AcZe6PBTR9zIkW9aj7oFwuwr6RTm1eODK8CMTxoWsjRsqljvkah?=
 =?us-ascii?Q?/VPvSJH45pE3A76+Z1m9M5N1FtrSApwNMonn3sGDjxt6IrF/ten0JUcezGMI?=
 =?us-ascii?Q?L3Ea+awclHr2yd2YL9LUemU4iUOybmP/o9MJns8HszTHwMTJpLG5p3TprB3O?=
 =?us-ascii?Q?UA4P/V+yy2+panaDqFf8vFPTCYv9UDpVxXnciNx8jBE4ZkgO3K66/EVoVYYA?=
 =?us-ascii?Q?qlgdRmjMoybKvfqJzkq25eUEdURM5kx48yGrzGQfDsHyE22a8YMZBNx7DqtL?=
 =?us-ascii?Q?qOKDFDchCGhCC05i8ES9oE3h9z4O5uHBV0ZpZ6AFjSwq4HyCE88nN5FzfF8K?=
 =?us-ascii?Q?ccYZrTnxwPdhzEzlLQX8u1gXLwrkgdLlD7kCC7OIm4bsKLbikyHkWfr0cIB8?=
 =?us-ascii?Q?hhuoNlFgjm6TXdCyuRn5yJIW4lBpeu+Un0K2xALcd1fNYJpdfywySTLQ0Bs/?=
 =?us-ascii?Q?SrNM8VHyDM/V9tqFZ1+pOUdFzndtJLjqna2FBbDK7im9m8Vbf/x92zNG86W2?=
 =?us-ascii?Q?7mQlGXdkcWU7D+ak2fRBSQA/OhrDueliZyo7X1klcd4M3U59tastQWu0GhK8?=
 =?us-ascii?Q?s0joMes+sOlDNZb5ku964xrKTQtLMV1z75Io+G2YFzBSOfwQQVTu/vY2O/SA?=
 =?us-ascii?Q?eVeMxSDK87aaps2nEAiIZgYeE5BMd4W9I1TdQuiD5JDV+CS/5SMi/8E/j3gm?=
 =?us-ascii?Q?acZlU47PzTo40WHPCmB13kDm2Gznu0S2Te2VrCH2qOa1/cmgnb4aBrgb8yWH?=
 =?us-ascii?Q?4VCUw4W9r+ZD+6yj61GUBoYVjXyTi4NVAOF7dfAUnIYHE49h7zcONjYsovaO?=
 =?us-ascii?Q?FylEICclYEBjlSdAAgKio0MNZG4H0XO+xn5yvF43QOyXbFx6epzsdVGIyBm1?=
 =?us-ascii?Q?5CA89TG1vJmBwzLhMekrITy7UB6DgEVb4eO4Umo68ExJF18o7aLzUhU9EZ3u?=
 =?us-ascii?Q?XnNDRKym8r/v3p6JL4vwgBIOUme1OiG2FM/RWC26JQw0J815wk+oahGg/jnn?=
 =?us-ascii?Q?WrIyKUDR0Ja4/4jHn0/+vWta8Lo0tg2/Z2N/b3wHHcvhslJFWiWxZp0pSp+o?=
 =?us-ascii?Q?c+0PaByBSbv+kHIOh9ErxDzdYqKg9try9wnoNsHb4Z9kthynKQiyKC+XU6vW?=
 =?us-ascii?Q?iSADnh2BPfLS7HYQrQsSh0jziWwMzR4Rkcr7DERB9BM++dYQc1V1cRNoHFKw?=
 =?us-ascii?Q?y18emkUlTmIbKbni/uukttf5oGAkAOIHWlwEsBvTDDjk8nvxc9fW/G1wombz?=
 =?us-ascii?Q?15psPrJ7WpUnH98LpGcgqdkvqf5aGiwXGStT68HvlIhu/7+onVPe6FuOynpb?=
 =?us-ascii?Q?vc5sYSxzfV2Yur+fIIs2HpKhFUpFVTIzk1jhpQsr1SRc8Fudq161c4lHFLAs?=
 =?us-ascii?Q?kHZZz7llwtcs0nTm7KDtnBDIbwbNHgTEaFCH6PKUPjCjDgXn6EvCTWrKY9tR?=
 =?us-ascii?Q?Ymu3LvDe0HVeFlpy+pSulCsOGEkJ2xdVVF/2R7jvDrpWq53tDF7sQkt2itoE?=
 =?us-ascii?Q?VypwGgg6LnO/yPOoPmLzHzDxsMzzB0+hGI/v9RYo?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR15MB49707806F571F1F2E0625BB8E6D52CO1PR15MB4970namp_"
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB4970.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2188cba2-0f02-4900-e95a-08dc9535def4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 16:42:58.5632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIs1SHeU+2NrKAdeHR2iT++Qq9KVsJibn0WrhWqhfIzuZawwgLSf+P3I9NFWbgvWo10fUI1UDB2pg+7c/BxQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR15MB6499
X-Proofpoint-GUID: 4Em7iqCplzyaHWqKv2E_gFEl5hhzb9qI
X-Proofpoint-ORIG-GUID: 4Em7iqCplzyaHWqKv2E_gFEl5hhzb9qI
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250118
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

--_000_CO1PR15MB49707806F571F1F2E0625BB8E6D52CO1PR15MB4970namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greeting,

                This is to notify that, due to Robot Framework 7.0 is a new=
 major release  ( Readme: https://github.com/robotframework/robotframework/=
releases/tag/v7.0 )  we have tested and changes ready to apply for the Open=
BMC test repository soon ETA July 1st, 2024

                Last supported branch for older robot framework versions le=
ss than 7.0
Branch: v5.0-stable
Release note: https://github.com/openbmc/openbmc-test-automation/releases/t=
ag/v5.0-stable
Please point to this branch if you still want to continue using the older v=
ersions of robot packages in your setup.

Current Commits changes to merge ETA July 1st, 2024 w.r.t Robot Framework 7=
.0:
The main master branch changes will be at version.
                              Robot Framework 7.0 (Python 3.11.9 on linux)
Note: Works as well with Python 3.10.12

               As part of major update changes, we are holding the merge of=
 the following to give OpenBMC test users to ready for these upgrades.

Robot file code changes in repository with new syntax:
                https://gerrit.openbmc.org/c/openbmc/openbmc-test-automatio=
n/+/68906
Build script changes for Jenkins HW CI test:
               https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+=
/71828

References :      https://github.com/openbmc/openbmc-test-automation/wiki/N=
otification#important-notification-
                                                https://gerrit.openbmc.org/=
q/topic:%22robotframework+7.0%22
                                                https://github.com/robotfra=
mework/robotframework/releases/tag/v7.0


               Please reach us out on discord for any further queries: http=
s://discord.gg/Wk3AEfXz

Regards
George Keishing

--_000_CO1PR15MB49707806F571F1F2E0625BB8E6D52CO1PR15MB4970namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Greeting,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is to notify that, due to Robot=
 Framework 7.0 is a new major release &nbsp;( Readme:
<a href=3D"https://github.com/robotframework/robotframework/releases/tag/v7=
.0">https://github.com/robotframework/robotframework/releases/tag/v7.0</a> =
) &nbsp;we have tested and changes ready to apply for the OpenBMC test repo=
sitory soon ETA July 1st, 2024
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<b>&nbsp;</b><b><span style=3D"font-family=
:&quot;Segoe UI&quot;,sans-serif;color:#1F2328;background:white">Last suppo=
rted branch for older robot framework versions less than 7.0
</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; <o:p></o:p></b></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Branch: v5.0-stable<o:p=
></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Release note: <a href=
=3D"https://github.com/openbmc/openbmc-test-automation/releases/tag/v5.0-st=
able">
https://github.com/openbmc/openbmc-test-automation/releases/tag/v5.0-stable=
</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Please point to this br=
anch if you still want to continue using the older versions of robot packag=
es in your setup.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><b>Current Commits chan=
ges to merge ETA July 1st, 2024 w.r.t Robot Framework 7.0:</b><o:p></o:p></=
p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">The main master branch =
changes will be at version.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Robot Framework 7.0 (Python 3.11=
.9 on linux)
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt;text-indent:36.0pt">Note=
: Works as well with Python 3.10.12<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As part of major update changes, we are ho=
lding the merge of the following to give OpenBMC test users to ready for th=
ese upgrades.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Robot file code changes=
 in repository with new syntax:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://gerrit.openbmc.org/c/o=
penbmc/openbmc-test-automation/+/68906">
https://gerrit.openbmc.org/c/openbmc/openbmc-test-automation/+/68906</a><o:=
p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">Build script changes fo=
r Jenkins HW CI test:
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://gerrit.openbmc.org/c/op=
enbmc/openbmc-build-scripts/+/71828">
https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/71828</a><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">References :&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; <a href=3D"https://github.com/openbmc/openbmc-test-auto=
mation/wiki/Notification#important-notification-">
https://github.com/openbmc/openbmc-test-automation/wiki/Notification#import=
ant-notification-</a><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp=
;<a href=3D"https://gerrit.openbmc.org/q/topic:%22robotframework+7.0%22">ht=
tps://gerrit.openbmc.org/q/topic:%22robotframework+7.0%22</a><o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp=
;<a href=3D"https://github.com/robotframework/robotframework/releases/tag/v=
7.0">https://github.com/robotframework/robotframework/releases/tag/v7.0</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please reach us out on discord for any fur=
ther queries:
<a href=3D"https://discord.gg/Wk3AEfXz">https://discord.gg/Wk3AEfXz</a><o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">George Keishing<o:p></o:p></p>
</div>
</body>
</html>

--_000_CO1PR15MB49707806F571F1F2E0625BB8E6D52CO1PR15MB4970namp_--
