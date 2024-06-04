Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C18FBFBB
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 01:14:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Aync2TbE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv5z10jxrz3dDT
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 09:14:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=equinix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Aync2TbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=38856dd86a=zweiss@equinix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1311 seconds by postgrey-1.37 at boromir; Wed, 05 Jun 2024 09:14:21 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv5yP3nCkz3c3D
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 09:14:20 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454KUcZS016037
	for <openbmc@lists.ozlabs.org>; Tue, 4 Jun 2024 22:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=content-id :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pps202002;
 bh=4VmITFTROfAuo1ZFDJ6HL9J0Qngp6hfHLSvFgrBXE3E=;
 b=Aync2TbEiD/KWhu7eahgtadL9SoPGS7IxIBQ+UqWLXDX5PswF2PpQBe4XZFrnV1buWqs
 hYVmrBJbKqwXN3sPeYLoBj8htGG1tar2mKsStk4A6NgR7YkaRPAgtsT53ngP2ognHiyv
 hzZT68hmwCiI0AnqO3gNybANOSDiryj8QaoPZgU3p0/zACT4652Tgl/C66K2I9w+LXWg
 SMI9xgOkz8qdkijjk7GcpHZsmDgwXFECFHXgiEBp4gZnn/ynPcxPk3Fg9N3cnDmX9NJc
 2HC0Yagmyhe9VQcDmm5OnRztekZBe+ksuCAWixl+VA2bl2t92DNj2uaysYIkQQO17faY Og== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3yhx6s51fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2024 22:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug6fgPxO4UgDPjwJ/rF7rarae3J/ev2z5Y2dh/FralMzZxN7fCMofpCi3Aq9t5utHQStEWDFdfGZ4QQavafLfufS/bEawdXSSfNeEZNJTCTlQfBrOiDBOOZKrncuZNg2TskB5EUvvlLaydJOfRDMIvPhSjkpW5kithJsAOFDJoR7pAWitkuto80SKF91GtGww7aKK4Mmya6nvw6LyspW5fxgZphhUE4zfLofcsYrAwdDxP4kjd3nUGWVjbgF0XkfF2uTPhL6g6q3gK9YYSOnWX5CagzwAtYXNH70SjbwhOuAl0Jz9bdhQ4HxpvfeEDWVA4HugQDV8S7ZRBJRoUZ9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VmITFTROfAuo1ZFDJ6HL9J0Qngp6hfHLSvFgrBXE3E=;
 b=FF9Ot1IfnJH3IMEbcoO9Yu66FAMadhFrcyxDjEbgWuFROMR+iCA35s6pUZmRs+/xDA5PGEEcS+agt9C0mlEdL9Mhv/sS6a+MtOvnMdQW/UvM83PUff4kQ0c3rMi2NPaT01qDDMrjkdR9Pqqh9ECCmgGivhWJYZezo5t1L8LywbXHZHS4W7+kvz5JvA19GYpoIG5lc8lOXTbtSoF5408v7Yh4pAKzuxFigP76QtFc/DlL1eTke8q/DQ65EKrlqHuStFuQ38ZNBD1AmCQmY58jLUTj36O28bP86y5bBxJKCiLzqdAaAqBgmlGvXNskh+LLuNtwGxl7PXQGjLUoXhY85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by IA3PR04MB9427.namprd04.prod.outlook.com (2603:10b6:208:514::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Tue, 4 Jun
 2024 22:52:23 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::9337:6101:9e7:9c95]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::9337:6101:9e7:9c95%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 22:52:22 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Potentially-breaking change in x86-power-control
Thread-Topic: Potentially-breaking change in x86-power-control
Thread-Index: AQHattHcP8sIfrLxMUyqj64kUfUz6g==
Date: Tue, 4 Jun 2024 22:52:22 +0000
Message-ID: <20240604225222.GB6918@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|IA3PR04MB9427:EE_
x-ms-office365-filtering-correlation-id: 4b20b593-c627-43bd-af4f-08dc84e8ff12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?PvX6we+7Mr5ZGqExwA4WXftCOUEL+QpiJfpnvpxXstoxD9kXOLxl5P4/r4EH?=
 =?us-ascii?Q?s7QLxG1TZQaoD6r8NGSCJZklLRG+wb/dB2vezR1MNruES/cOk8ImNgQMAx06?=
 =?us-ascii?Q?wss3bzM6bV2HsjqiHsRjdQza2Rl4m4N56OZlAuULwu53rPGSbFDCbsjJvok6?=
 =?us-ascii?Q?60QhP975KIUd9HVfn9bGxAfA7JLbooSSfD1mkjh52HEr5JiKC9qO17Dm9525?=
 =?us-ascii?Q?oned0NxII2LT+OUCsU6VRuh8s9RUbKg6odZ7X+2cGS8KXWsnQNL2ztKOeSUd?=
 =?us-ascii?Q?ETg69DhbQMKoPGaVzULlzNAvp+1duJx0BojhlT8AUmhplk3k4xBgm/efzZFF?=
 =?us-ascii?Q?Al8WAtH6i/W6XKmAUlnfE0grwVlqlEhMuG8gEC86UA1uvu6rDxDSgJHLW9u8?=
 =?us-ascii?Q?09SNzW/1KwfmrGv+Y6bGwR2M1Ip78J9X59gUH0UncCVZ3uUrkdZwu7yvIHlT?=
 =?us-ascii?Q?NtUGmCYELLeliSHl4vFe0N2eUTnD1RATOuJfFFDEc69arpwh1cEvdjCVZ0GF?=
 =?us-ascii?Q?zaKA/9lVCEefLVu3kwxJd/Zy04U8Ja/LrLptlp2bPJ5VtsxMHjVuwNhIXnZj?=
 =?us-ascii?Q?IgidOnmETTmpx0DYa7tONkubFUUHr6VqMm61o9Z8I8jeSvUF/rImi3iFGfWJ?=
 =?us-ascii?Q?ZL7zOdQZR0rW8N4mnhJM9e3NSJWnImoSp440EYdgHGeJItdWvyHo1ZkFX+De?=
 =?us-ascii?Q?IM/6jCEQEk4ReJuwhDslnaokqQXP7LH5BUqUSfF/PAG5eJ+86+u5krWKy4wt?=
 =?us-ascii?Q?Bcaipo7D3KXIEZN5IEIZ2ilsOhKpV1fye6mb17BnCcwRvoR4e4NPUFAWPLAz?=
 =?us-ascii?Q?nK3IIgRV0X93m19CoEEefZnyDY+IZvprChUpkIOrVf9TlnrYi8nQqU7yhIy5?=
 =?us-ascii?Q?Cllg3gb0arK618+ogu/o9I+o7fNwIO/LfYU8dcqY4VOOzoPGjDnGVPTwALBz?=
 =?us-ascii?Q?H5iDoNGSuK51ztgg4LscuTP3F1yh07FUXuFs89ffTHZtDHIyRozfX9yWXWgi?=
 =?us-ascii?Q?gFADrp6XPvFdwsWITJF1HlN9n1CMZ9rdQgiuz8yjZhsc0LLYQhcHj7Chtu9l?=
 =?us-ascii?Q?Aj1HAQF0wIJs1sHQ3cV4Fk8JNy+YYdpdBSUji10W4JVn4r/MDhgAo3kC4dky?=
 =?us-ascii?Q?YYdIp3rA+zY1P1ZFNju6NN1/vqJcgF7jQH958z1im5Kc4fPxPeONJpkzUoDj?=
 =?us-ascii?Q?hdYq++nEYqHl7aTpLfeq4UwBm5/kVdU1RJhWtX/rikvhtF96pBn0GKKSowjU?=
 =?us-ascii?Q?MFUu8DXnX3fcBbzv0qJF7zidoJAFl38PdbqbotMNT56hubTd8OeeyJAfIpP7?=
 =?us-ascii?Q?XY1hgQYqNfAwIO7l+8600aXL?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?XRa7wa1vE2m4PaRjjuQjP/E+X3jU+YtaZahgwu3ejoiF0huuRvuK1CGexgbC?=
 =?us-ascii?Q?HbITTsDgb5wNxeLpSY6Uo2uZV9zxta1cYAZmZhOM9I6mcdFJbtivy3GJO6RD?=
 =?us-ascii?Q?J4khFwU4mwqJ7xEc7MY+1ghlToGUlC1K4vu/WECyR8Y8Za3+IW/A5CSjo+9j?=
 =?us-ascii?Q?9TkUK32KCyHZ9qCQFBjhSh3/8lsAiLjG/L419fLHB4S6zyv+SO5bVeBfry9F?=
 =?us-ascii?Q?r53q9PSte16K54V5LXukhKDGbv5NUz2lUJJKwQvcjv4dmbfPEnrGprH0tMhS?=
 =?us-ascii?Q?Cqkap96oJQG/rv6WtIu7PdLFx1x+iew2Xz+Oqdzq4feGzicCSaDFkFL/LmpO?=
 =?us-ascii?Q?ivtGMrqtO2gV/AtwV0XNhZwfD0E7blUvFaT9IwhxNvzSZe9CiZbqfi6NQFEu?=
 =?us-ascii?Q?Uu97QWCOxJXvK6hJtYnVMSo7GjuWkfcfvBTv8v4ojiKlyrf07xQshP5rafB4?=
 =?us-ascii?Q?k203RHnpOVVotitHXgBB8gBKRdSgi0s724idRwx7JnSJrZxdpTwb4usm6L7X?=
 =?us-ascii?Q?XN9RtUrLvU7tC3hnrNvIICRbz1veCnJPduvoUaBash6nbm90/TCJHmhQLznJ?=
 =?us-ascii?Q?qXfSN20Y9B2XmIgMNHulFUMYpxImg6GssYWKuliM5yCimzHSbN3dTMx8oL/Q?=
 =?us-ascii?Q?pv9hE9umGwTf0WXLfNdtrlpyL2cqLW9p96+wo6ZF1B0Kbei57WRuJXNAqa/k?=
 =?us-ascii?Q?Mc7SAeNJRrlVIC0HYAsQVHWSTNNY/YW9NegYhH/5Ap8yr+x/w9iiHjUqUdC2?=
 =?us-ascii?Q?Q1ByEE8tcY+JI03OEjpKCzJfetJcatpDlWxYNhwchSGA9Yzl5TubtgNV0koT?=
 =?us-ascii?Q?DasUYy66wXDNUPLRE+BV5TI6yVpWLsF1Bn+CuYrNri4x5NHYqv4JCkSO91hr?=
 =?us-ascii?Q?H3zMbAkGRzGAMFWY6xzOyyE9GrOrpCrlT4/4SsX84/Mwfrli+6lCACshtQAL?=
 =?us-ascii?Q?6GFqO9krJUWUsd5331snqAGZUO0wuPGyZokf/Ydebz+Gzp/cdhkkBx/F1gPj?=
 =?us-ascii?Q?UwxrNU4CPsLYgZysRu3qZbxPRNmYF9O6uManKQmNBlb0TfDMU6HQLBk9OhcT?=
 =?us-ascii?Q?vkvGGJtn0Gqb3RhuqFRUGnJ4Qgf1eT822c+D/rn9ej76PvO/hhrvd+YPWTz6?=
 =?us-ascii?Q?PTCCRpEYNaGENwqKDsRgsLbNd5ti8H1AS1cfvT3WmSI4GIVYhXDZfR6YM3ma?=
 =?us-ascii?Q?A2vBan79CIy0E/RXZ/MQDeohAakCA1/K31H00RnfdNabusKY/Pg19d9cCwjy?=
 =?us-ascii?Q?4aIF+ZyKqYTv6yC6R0ZfZJh9uc+Jip/SD2vo33+EQhRBKbG49B/dB7k5RA6j?=
 =?us-ascii?Q?CjwXXisZkFwmUaIJbDTzKf0upLoADdo83gUEhPI3ijoj9Pqkxl8ymD8fGs5U?=
 =?us-ascii?Q?BAFIxLcIsQLGva26N8IFRNHI8rWkDBYWyo5lw1ahVLQ2ULLUa3f7GrmwCFa1?=
 =?us-ascii?Q?m7w4MjOwg4wWIbJATBiWRXwsa1K8W0u+tTmFKoh/GtVh5Wjs52In3YjUql/6?=
 =?us-ascii?Q?iX0Dn3/YuNT8lNM6sfbgrTYHQo84WY3KiQ53u2ionNQRo8W3gUmE57lXSRQ6?=
 =?us-ascii?Q?XowaAJQ+DnsZOcxmrK21/hD21k5oRJazmiTWAGNt?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B64CE1B5EE708B47B70DB7BBC8A82C89@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	D76RM/Jtu1zDaUrOidsqoRvHcoMEIN5nmwJ3SkMY9xsv3WanbWs/dOpbiu7XroF5PksNqeIUroRG6jfuQpr7oA9/uWDpHkNHz/+o12TkWGprZzaHo2lNa8qc4j0cbNxz9ZPflMB+BSHw0ss8Tma7F9gozK16uZKDHbD/hrCXUcEaTYgRMeC21GB7jhBqXKJ/t8RVu2n47fTB3fsLQmwkcv11iXtexkFvRiqqlT7tpsVm9FBcex3B/QfEnvDl/8jjv3EQVwvgeiSs4nl9WZ7tocqdBteJsNGwnccjFLnvC8LCdu3SHnUN2VHBFuGM6WN2KzbGkWc3sz2XLMD/c0nfXsxssRaM71kdI3LLX8vXRDQn/gAlakQSe5hqupNa+X+eYP/53ASgCgBjGI40Nlxv4DspjpheMUDp1FcmXEJYj3g76vd/QVdvoQl3+QoV2eyxSG//DG0P+dbsW3eU6mcG9npiWc55wb1fdzdGjri4WE69wNIKr+RUvu2CFf9U8CQfG7YFAO5LkVi8NuIhe6AZ1EukOulk3vNDLL3bAtglR1/d6txyLf7iY5KsZuLEVXEjz7wbNDo6pLr74elaec84S/TSxoN2DUU/Gvudst2+7VD3KEJSEa5+LLJgdmZH1dFUC1f4XclB3MiST3qZeSSgbgiXixYgI5aQpBxzSmaQQv0=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b20b593-c627-43bd-af4f-08dc84e8ff12
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 22:52:22.5973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wQAeBhd9nqkTwDOizIQYKIcEvqfsQAp9ylbmvQYkpWgTBwhylpcf7yDIm/i/L9CwNUSCuQ0+eveK8E69omggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR04MB9427
X-Proofpoint-ORIG-GUID: dQiRzl8im8sRR7rh7gqw2v2iyadyltMq
X-Proofpoint-GUID: dQiRzl8im8sRR7rh7gqw2v2iyadyltMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=806 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406040184
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

Hello all,

This is just a heads-up to users of x86-power-control that a
potentially-breaking change has just been merged.  The patch in
https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/71283 (which
just went in as commit edc86f3524e9) makes it so that the polarity
configuration on input signals is no longer ignored.  At time of writing
it hasn't yet gotten SRCREV-bumped into openbmc/openbmc, but barring
something unexpected it probably will be soon.

If the polarity settings in your platform's config are already correct
nothing will change, but if you've inadvertently had incorrect polarity
settings on your input signals, that error will no longer be silently
papered over and you'll probably see some incorrect behavior until you
fix it.  I recommend testing with the latest version and fixing any
configuration problems it turns up.


Thanks,
Zev
