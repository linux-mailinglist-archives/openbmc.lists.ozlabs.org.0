Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507354A807E
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 09:38:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqBrY6bmLz3bcp
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 19:38:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=KIv8Olrm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=50331d0dc5=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=KIv8Olrm; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqBr41MzJz2xsq
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 19:37:36 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2138EFUF000982;
 Thu, 3 Feb 2022 08:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=cWXwQkK9N3wAENC6xrEjab2bbsXa7OjgwybnQzYCRaU=;
 b=KIv8Olrm2vcJ5XMP6StLfC2Zix82IeSbJ5W8VxTWJ/NJFRXaeZRN915ZYw8+GUIGSFQv
 T7s40kPB5m0PnDV6WMFRMF19dGeRfhWqNh32u3kkt1HfAGkMHY+CA57CCIB41uWafRoB
 pPTAXnlGz6QB6T5vcDPJUZ5ZjWJ1DMlCKzE8H6mQMrod1mZmIRL+M2NhgSRXdULxhQN5
 BSn5JtuvZye0n5At8JOw75PipsB4kMhcK3+10ne4O1ipHlY3OJV+fGLGBP5OIkt2eyWP
 fXER76nb4Z611bGppwmMHVlCrF0H3ifv+c81Ft8RoWSJe5lDjIsWaSQu/1KQgvd0PM+o Uw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3e03hys56p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 08:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+76ulzQBugMCEAvMahVYK9slkvZcPEiT87QccJE9rNeA9fdLQ2AOJCMkdlczd8RVOT++TEbiYsgoyPSGW8heIxpvFjVOldYykdmLhW8ZxCqlmZRqzHWydd1DFIPuyevPcaQr65QHRou4710BLUbO8I/03KZ1ZmAB/s1yItd16tzFFByoddKe2xElAxkU4FonJ2WwZygkXjNPgQwvGJA/idrmag5U/liAaYEjmwChuyaSXN1An/t78Q/JpxiDTlA8T0XZPp79bnEUuQm8bIwA/fwQPT+sOrkpLvqmK2Fk7zqNcekGM27utR2Kn/iTFoWtoUoCbG/WyX/3aXs2MYl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWXwQkK9N3wAENC6xrEjab2bbsXa7OjgwybnQzYCRaU=;
 b=Pf0dozbLNRg5L7C0HOCx1rbukPEJHWQboalZYFz9vUZJmKVeUOszOnHKTg9P+9+nnn+sq9NBKjOZOu5egg6N+FGIXsiuAJRszqvU9PrGCP2MrQdcBYgxG79ox9fryYdpz6sUWmFBooVmvZa+w6q8tmyKnzckG+Vfl1+XwA/fpVx3h0SHvM8PSZwqxSCd1aq7Ede/hGjz/EIPmFdjvxblT8WpjPOOkJ4ZEUNcxJhm13RMRq3an9k2IaMnWAfmk3hQDIwreiMdFWsEwSKpoZh1zUfS+PsSE+nNZcBalYjRKeo4b20kCA23bl47AUdop73NFjslUbG4j0ZqUcJCcyjfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by MW4PR04MB7188.namprd04.prod.outlook.com (2603:10b6:303:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Thu, 3 Feb
 2022 08:37:20 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 08:37:20 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [libgpiod PATCH 3/7] tools: Add value support to line name lookup
Thread-Topic: [libgpiod PATCH 3/7] tools: Add value support to line name lookup
Thread-Index: AQHYGNlBFUsG18Jps0S3Ec0rivTcpQ==
Date: Thu, 3 Feb 2022 08:37:19 +0000
Message-ID: <20220203083719.GN5754@packtop>
References: <20220203042134.68425-1-joel@jms.id.au>
 <20220203042134.68425-4-joel@jms.id.au>
In-Reply-To: <20220203042134.68425-4-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5adb7058-1a54-4abc-bd83-08d9e6f06460
x-ms-traffictypediagnostic: MW4PR04MB7188:EE_
x-microsoft-antispam-prvs: <MW4PR04MB7188C6FD021ED779F319A070C3289@MW4PR04MB7188.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: leRKoqsss/rEvqfTyADoAVW6u6WbzLtg9azKTjs6vxl5mCx3wJi0Gj8ox0q7AedMVwHAmralNjyIXhQNCJrNlBFfSYw0foqJUQCbSOLS/Hw28ukUKTjMK4amGb6+vpW+oAKHrh8Jw+e/vKyRBZqc3ohDsrkN1qsUMbcV+rIJNMM/AeUMlAqJALhSKNP0wjpSHwJwOXdI/ADdUnVLWjCbn/7C8vmgyEpz7vVO+5KqxPa079uL8e8mYYU/L01fjSV46bz26q1LcvAFobtBTphPmSiEXg04yGgQZRW4eKydShLauC8B3hHP61YggtLwQWGYCsmp0lrBVvcNRA3iAK9UzOZhoG6RTQzOk/yP5O7FjKWToho7jexCn/41PyO4uh/tvKXSLYQ89Jw9sSR9qC6M23tmKn/P67j/h5ZJBXjFzFoG+LnEHALGCeC+lQab7lWxLUKYTMDKehJgWT6jlGH7QOlDzUML85xmoX5Ey6a2Pvi0ksyG9zO3jOksrdwBjXP9eoLeqOacClSBwGRxH8tFBHp8XlYxVL9IlE0q4433CrbGnlmy3w07NsDCGWmIGmTnGlr4xl0r0oUfZF6veNmoObcHBSLAZlAZgQlw7GEgJOZzc1xriFphOfYqnnQ7XpYgOkkdCxuRAoP1/qg1I5hX2KMB0/CFfUPz/7Xcv1CL8iN5u29CiZvLoS9BuAV4nSmoRtfnMRf3grMTrW03LuN8/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(2906002)(66556008)(66946007)(76116006)(6486002)(8936002)(66446008)(8676002)(66476007)(26005)(64756008)(33716001)(1076003)(71200400001)(186003)(4326008)(122000001)(33656002)(38070700005)(38100700002)(86362001)(508600001)(54906003)(5660300002)(83380400001)(6512007)(6506007)(9686003)(91956017)(6916009)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?unH0i/+Nwd5Ol4dSc+NFJmexYSCoB3r923oYfQc/FOsls5C4dH+yUJI3BubZ?=
 =?us-ascii?Q?JhhQTlqNMSOGZEvApQmu5szUWlHEZeJbhV80KSgKxOUbwGH+KcPR5uD9m0Xd?=
 =?us-ascii?Q?bXhbTEDo1CmrXJGBlSPB1G49LrmjGZiYq746El265mmXhEeDX7zpIQnTT8dU?=
 =?us-ascii?Q?ZaACn4Ub2GgIAXuPNxY4qjeptsEa5mJaf5ksN+lzgQn4ROHWJFPmY99Ku8L4?=
 =?us-ascii?Q?P/l1YamK4ZWJpbw2/81iyEd6HvIvD4miz70NWSF/I+BorpZm1Hp7IinZOSL0?=
 =?us-ascii?Q?+i4H3urmfl2Lxz23iikpMN8y2qUsA7eIZj7fFJ5dHjvr9Y2M8tRcd2kwbkeY?=
 =?us-ascii?Q?oTY24pNEAqXz7iZ3bsrjJ12dGjZKj50vqiB5cqci/zSMEhBupIqN8c1wnnHE?=
 =?us-ascii?Q?I3jbPlGtnoGI49bnOaOIf/HmaT1JKOuNl6tY2R+OPEizbA/J/hWt8AKLppui?=
 =?us-ascii?Q?E5IMqTfwEiPOXjoFMvujN0GYj8L2XGXlac2ci9unYSIDTdVMk5CbF5gfeEqY?=
 =?us-ascii?Q?at17WezYdU926xJ/RdGPtYQBdKX1GAvjbgRTUlWl9OqbmhUfQbTcCqZDml7r?=
 =?us-ascii?Q?Ac3l4kCgC0ipDJtr71qOApWZeU8cDRwZmzbJnCUFpIokxkCLBN6oj4wqfTyR?=
 =?us-ascii?Q?nVZ3q4W2jCRNPs7uXJxku2aEXXfiXQVosONLCIDqRu0PKEfiUDoVQZce3Gr+?=
 =?us-ascii?Q?pO+AFmu8A9FQZAi9lNEcNr70Yz4iB2a6iV5xVoGYSRearqpZl9N+YWAe61db?=
 =?us-ascii?Q?WnAuDnRrO7M7ZohTbc06PmMvmckpajjRAFvnSBDPmnzcx7JqqPHziQxozKwQ?=
 =?us-ascii?Q?ZAtB/pL9D+FuaAQqcu5QOgvZJhgctHM1trVh3Gn15ejJo7Xu7b3FPDDVIsEU?=
 =?us-ascii?Q?TZ3MT1R8hZOLIOlYzVLqc+h42m96dlgBDeO7oBqGgtUtoyrp8UBKh6kZFY1s?=
 =?us-ascii?Q?7UTA9gpQNSGhIrI/KKX8QnG3UucHOMmbnICTERoYJLVWXjzuH4znrYq6chnl?=
 =?us-ascii?Q?Ux7YJSNpKc9Q/H28Ew2JCm+ee3WCDMmtrsf07zP3KZcNKezu8wf+0IqDTmfu?=
 =?us-ascii?Q?XJwIFBdNJdPl+CwF2dJPrKZQvnXZzS4LgaeQ2Tit1Oe0akIna9zuiR9d132w?=
 =?us-ascii?Q?qtNRwhZpBJyZ44zeN2fWRzffr5/qUlnw5WGdUQ4PAZDK9FKe6zgNjvYiM3Rc?=
 =?us-ascii?Q?CY40DwOtsXVEhgbwN0YIL1lye2fy9EN8bCrHk8TYHkJbpRRRt+NRfwnMU0zt?=
 =?us-ascii?Q?akQzfDpAtW71HeYTBa0IWlkIKndUK5TyaxbyKIX2zKGNJ9Tn2jqne552NRCv?=
 =?us-ascii?Q?uDdsD0tzzz92j7pCrcV8r8Qaao1P9yb/Lf68O0Ovesr3jPAFHFZwlMfSRCWC?=
 =?us-ascii?Q?n8wfgVGWfInFqqYSBGkux/7zMudiuXQomYo8YawBT4N+/+Z5T9MxcgUen62u?=
 =?us-ascii?Q?JCkrXrCVKYhw5g2Sv49LVU+HbgHxFp6Pj++VBSaWXQG7CKRaeJP0Zit37yQn?=
 =?us-ascii?Q?qk1FhY15+cOE7SPshwxU8xW7Iilp9srgQ31sGjLnDyR6DuKhGegdgWIonjc7?=
 =?us-ascii?Q?ygExHbVv9fzDU5P/VGfuiQzD+WEfssCov0e88PF58bnxpEKWVnun2u6UAc3E?=
 =?us-ascii?Q?i9ocDg1rKSiem9vsnUwT+WU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2A68CCD00501ED4D840A3AE0BDBB8B17@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adb7058-1a54-4abc-bd83-08d9e6f06460
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 08:37:19.8674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0cnhiSgZn70EyE2Q8CjgfOGVNnif8r8Hgb1QyeTMbDHVvEwkT02JxE8cD2W4hJtf9ezLqqRf05Ewq3dhcjG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7188
X-Proofpoint-ORIG-GUID: V5RmV9ers0LmfqgYuq9_CUhXp6eA72GP
X-Proofpoint-GUID: V5RmV9ers0LmfqgYuq9_CUhXp6eA72GP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_02,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030053
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 08:21:30PM PST, Joel Stanley wrote:
>Add support for pasring the values as well as the name in

Nit: typo ("pasring")

>line_names_to_offsets.
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
> tools/tools-common.c | 51 ++++++++++++++++++++++++++++++++++++++++++--
> tools/tools-common.h |  4 +++-
> 2 files changed, 52 insertions(+), 3 deletions(-)
>
>diff --git a/tools/tools-common.c b/tools/tools-common.c
>index 958933ed6d51..586577566790 100644
>--- a/tools/tools-common.c
>+++ b/tools/tools-common.c
>@@ -204,15 +204,57 @@ struct gpiod_chip *chip_by_line_name(const char *nam=
e)
> 	return NULL;
> }
>
>+char *split_line(const char *line_pair)
>+{
>+	char *name_end;
>+	size_t name_len;
>+	char *line_name;
>+
>+	name_end =3D strchr(line_pair, '=3D');
>+	if (!name_end)
>+		die("invalid name/value '%s'", line_pair);
>+
>+	name_len =3D name_end - line_pair;
>+
>+	if (name_len > 32)
>+		die("line name exceeds maximum length");

For mult-line invocations it might be nice to give some feedback on
which line name we errored out on here; perhaps

  die("%s: line name exceeds maximum length", line_pair);

or move the check after the strncpy() below and use line_name if we want
a slightly tidier message without the trailing "=3D<value>"?

>+
>+	line_name =3D calloc(1, name_len + 1);
>+	strncpy(line_name, line_pair, name_len);
>+
>+	return line_name;
>+}
>+
> int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
>-			  unsigned int *offsets, int num_lines)
>+			  unsigned int *offsets,
>+			  int *values,
>+			  int num_lines)
> {
> 	int i;
>
> 	for (i =3D 0; i < num_lines; i++) {
>-		const char *line_name =3D lines[i];
>+		char *line_name;
>+		int value;
> 		int offset;
>
>+		if (values) {
>+			const char *line_pair =3D lines[i];
>+			char *name_end;
>+			int rv;
>+
>+			line_name =3D split_line(line_pair);
>+			name_end =3D strchr(line_pair, '=3D');
>+
>+			rv =3D sscanf(name_end, "=3D%d", &value);
>+			if (rv !=3D 1)
>+				die("invalid offset<->value mapping: %s", line_pair);
>+
>+			if (value !=3D 0 && value !=3D 1)
>+				die("value must be 0 or 1: %s", line_pair);
>+		} else {
>+			line_name =3D lines[i];
>+		}
>+
> 		offset =3D gpiod_chip_find_line(chip, line_name);
>
> 		if (offset < 0) {
>@@ -222,6 +264,11 @@ int line_names_to_offsets(struct gpiod_chip *chip, ch=
ar **lines,
> 		}
>
> 		offsets[i] =3D offset;
>+
>+		if (values) {
>+			values[i] =3D value;
>+			free(line_name);
>+		}
> 	}
>
> 	return 0;
>diff --git a/tools/tools-common.h b/tools/tools-common.h
>index 7affea436a60..723999011733 100644
>--- a/tools/tools-common.h
>+++ b/tools/tools-common.h
>@@ -33,6 +33,8 @@ struct gpiod_chip *chip_open_by_name(const char *name);
> struct gpiod_chip *chip_open_lookup(const char *device);
> struct gpiod_chip *chip_by_line_name(const char *name);
> int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
>-			  unsigned int *offsets, int num_lines);
>+			  unsigned int *offsets, int *values,
>+			  int num_lines);
>+char *split_line(const char *line_pair);
>
> #endif /* __GPIOD_TOOLS_COMMON_H__ */
>--=20
>2.34.1
>=
