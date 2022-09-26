Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576C5EA824
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 16:15:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MblC72859z3bZs
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 00:15:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ju81bp0u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=40.92.107.71; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=naveen.moses@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ju81bp0u;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2071.outbound.protection.outlook.com [40.92.107.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MblBc6xjBz2yMj
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 00:14:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5tY4CRUl9lLMnWZzWVYAeN2/RqSrPh7v++51KpN+j0IUc7v93dhed0eaGR2kZo/bTJ4dtxo3Oz+IT95wbmQAoXTyi3fMTWw4Veiq4qB2hhgJSaKTHaa5+cemAj13plj5fpeg0XoRNP+DhZQOX/lD3oihXF6jxN8uKhexNorFL8tYmZ6qoBEyTzlwklMzGTrtKi+ggQy6rXXQ7yE91311fPh8jNAbYXbeoUTYftOJNECbO5hvD+M70fuEaWuTA/SM7dVoY+2S5sr7X9nsN+4Y5oiWcymzCtwpHn/rSKZH1YOEPL0lq+lolIXlsFk8pymhYxyL7YL7fZ1vIHil3wqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8vCOgcNqifoggozPY5Uf5yvxV5ZpWe56Z3s10nMrEA=;
 b=W70nBKumxGe0K8txfl1CxzPLn+/RuhhYNsn7mrbnUNa8M7DrIN+09c7u/Y0vy8NGTYwiFlS+qmjjy9XsaXWlYKG2Ez7s2V+1NpL99T5yMppt943QbjUwUM/7DHoBvuLAHqM2p2s/0Cav7iYMhJeYI8+OoCSw26bBKF9j0RwVu8v8ybQHiwYYaPbIErjKJn8BWIykUVEa4rpdr4DuG7SHrbINSx1S0U8o4nuWAcb3yxjOw69eIFdVd4Q8fyAJLjMCI9F1Bde9nhu/y1TxkyPh1vMR1xfMTfRj7f/eYOPKCauESl37h+61lh+38QCVgRoqk9bPCY5p3aslbgI0OoOh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8vCOgcNqifoggozPY5Uf5yvxV5ZpWe56Z3s10nMrEA=;
 b=ju81bp0uBRuWCN+F5GCsaK8zqhpyMUVaKAHF0WZOTHzkzXaGicYGJ4wiTZHa+5+n5Kroo2RGWeG8moHoetEAreixAm4nSEFWT2HTJtsx3LTsI54nDdMBlnQxOhAOQkNoysRIKMWU/qxKgBAuO0YMW+lne2mAbzVfpxuGmc+8exoKszgm8hX7ReYsk769WkI5Sj4ENgxxZCyfOPU64cuwRAq4VFZ3PNLFlHhRwGVraXmNeq+j+QDSvDcBeSYv6UEGGwz18o+P8b9UUMzyZECaRk5e7ZP/m64CZbv17jsAh4sRvce0huLVKERUkrc2EevrnE6+9Y+1U6UY1Y+J+IZQ2w==
Received: from HK0PR04MB3236.apcprd04.prod.outlook.com (2603:1096:203:82::9)
 by SEYPR04MB5691.apcprd04.prod.outlook.com (2603:1096:101:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:14:28 +0000
Received: from HK0PR04MB3236.apcprd04.prod.outlook.com
 ([fe80::48bf:fbbb:bcfd:f0f6]) by HK0PR04MB3236.apcprd04.prod.outlook.com
 ([fe80::48bf:fbbb:bcfd:f0f6%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:14:28 +0000
X-Gm-Message-State: ACrzQf3yeGCtPDGR2BGTmUjGR1RY6zrxipguOnp2a9wn7qoX10PmHRvX
	PBJIXpa+/sGsLu0dONIPGj9d8KTB5aDcaLGLQU4=
X-Google-Smtp-Source: AMsMyM4AXS3C4UFDBfgC2wgn/dUdUgIiRuwQ5wwVa161uhCOrtXFNaw/pimF4ocaXcfjr5TzJ4T7deybsqrBMfVWlFE=
X-Received: by 2002:a17:90b:33c5:b0:202:fa60:3769 with SMTP id
 lk5-20020a17090b33c500b00202fa603769mr24936826pjb.60.1664201331726; Mon, 26
 Sep 2022 07:08:51 -0700 (PDT)
References: <000001d8d178$845d0900$8d171b00$@inventron.com.tr>
In-Reply-To: <000001d8d178$845d0900$8d171b00$@inventron.com.tr>
From: Naveen Moses <naveen.moses@hotmail.com>
Date: Mon, 26 Sep 2022 19:38:39 +0530
X-Gmail-Original-Message-ID: <CANt2+yAw_uZoz6NB4ydyn2h0NnmUOmFPPXA5xv1M6i05n=LX5A@mail.gmail.com>
Message-ID:  <HK0PR04MB3236B36A4CDA767F59DB290891529@HK0PR04MB3236.apcprd04.prod.outlook.com>
Subject: Re: phosphor-buttons multihost control
To: zehra.ozdemir@inventron.com.tr
Content-Type: multipart/alternative; boundary="00000000000036632105e995113c"
X-TMN: [0vxF9+QZQqAM9gnpI4nbONPMgqTNTDv8]
X-ClientProxiedBy: DM6PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:5:100::39) To HK0PR04MB3236.apcprd04.prod.outlook.com
 (2603:1096:203:82::9)
X-Microsoft-Original-Message-ID:  <CANt2+yAw_uZoz6NB4ydyn2h0NnmUOmFPPXA5xv1M6i05n=LX5A@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK0PR04MB3236:EE_|SEYPR04MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: cf36ffd2-3f3b-4649-5435-08da9fc96c33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QKSP4ki56NYRv4i+ZR5isSercgiSQljsan7lqDGx6CVwBYddRR4x6gDS3p/ZaE1cfhibFhzs/m/L9K/QVjttJOUFYOwTzdOomFykyo/2aH8Ml1CRwKCosMM8o5nN4R51VRgCR5pkbo/+j+ulSBiVxRp4Lg0lyG/IOs2mPoyImMSiOvNzmeZkLVwWrcsOfVUg83OCdBNbskFOakgfD+ZyepZkphCEfejgUSGkz23jOZo586bzTEPwdBXRG0cEwy2FPtYHmmBq6TpVNqQJ2W8uWutm/4tbMVs8DtXquYm484lm8w9oUJ2yqnpvYc4Gw4j+JcfbhQVxENqoNRuVyBjAc5AIpJMe0Nw2LqncwLL3MkRO2R2te0OJWru1T2pDPvMCDbhoHJXGF5wruXbVIEBSosw/jQw2diW47cOmkjt6V/Q5EpvZHOEomORLYingMUZHfJ9aDLPsAPYXuepaMd84kATrrL6DXm3b8hzmjaXxCdVr7Q04qeHJ44P0AU6aTQBeHYaSWRP3gUVBkV4cPghtULELhcXyrA6iFALmBLBaY/whDegR/nfHn0PWNPqjNuhSEk4SsczdWvN4D49fr8ag1norPHY1aKN27PgX7faJrF/RtC61t3V28EGoKvl0GVW38rgY5LlpxDuDvCVU37NcWScKWof8p9cBpR8AHvfQiYLyCXY+VDpvfjQ5psm/GdDP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WCt2L0w3RjlCZWtyL3o0NHJ1ZWVEdjBxMGlDc0lHenBWU3V3M0lhbFNEMmlD?=
 =?utf-8?B?bU1zN0lNaHRYTThpR1FLQnFmaW5vWGROVkNHdDdWVWRGaGI5b0tVWG9qaEQ5?=
 =?utf-8?B?VzVxOEduUEFLL2tmZzFNTTlhTExsTlZSQTcybUw5WFYvSk4vNnFReldyQ2tO?=
 =?utf-8?B?cWt5WEl1ekw4UFB0K1VUYk9CUDRBbTFMOGtwWUtzMGxKSU96WC9XcVYyTHJQ?=
 =?utf-8?B?OTRnVUVJTDdSSWtiNlNGbFkvd2UrRHZqQzV5NjRIK1NXTnJGQThPVzRBdW8z?=
 =?utf-8?B?N21PakNXMjVzOVEybmQ5c3R2TE1uWk9PVStXdVU3SWFUUkhRUWUvYjR1NWk0?=
 =?utf-8?B?VEhUZ09vaXc0UDd1dVV5YTQ1WWkyNm92OG1uekhaMXB0c3VZTU1KVnZTOHYw?=
 =?utf-8?B?ME1sR05jbzZNRTJTbFlPU2RwNGtNR2xVcXdaTXFRNnJkMnZHeG16U0pyR3l4?=
 =?utf-8?B?eFYzMWFvWW9FeVlPTVpXVTM3R3h5ejVNYVpFb3NSSExvSUZqdDN0RDRVT2R1?=
 =?utf-8?B?Q2UzRnZib3dRdlIrcXczVnBKOTdCNWMvblAvYW9QM3dFbFIxV1Y5WHY3VE9u?=
 =?utf-8?B?RjgrM3JET21MR3pVRlltTWZhSkZGSmhGc3F1WDRtZlo1WmVKeXdRT0dSY3gr?=
 =?utf-8?B?bDJtNjBDVnVRWjBLeWN0RkpBR2JhalNZcnNBL0swSFNIWjN2Z1Y1YldZMzRS?=
 =?utf-8?B?MC9MdlZ2NitjY0puTnY4S0VwQnp1R0xzNVZGRG9lZzNpUlVMczdvSVFobnZX?=
 =?utf-8?B?enJ0eEFrT2tYT01ZSVVra2lOaFU2cnB6c1NPNDNiNEl6QU56WlkxSmsxMGg4?=
 =?utf-8?B?eTZ1c0ZXaWhscEZVekErUWhxWUpYSExWVHFnV2hhRnlFT0I5K2hVbHFoMnZH?=
 =?utf-8?B?K2RVVzVKOTR5dWkzclRYNDhxc0lTRE9ETXF1M2ZIcU1GWmV0ekQ4VGhiczZi?=
 =?utf-8?B?enJmSFZJb0c5RnV6c2RMZmJuQkpVa3JoVDV2QUpaeVQxTjc5bWJ2WWFCR0VP?=
 =?utf-8?B?ZFdPbWJFS0RDdVdhUHFIOWpRTll6anVmU0g3T1g4ZlVZaHVsbGlBS21Sai93?=
 =?utf-8?B?WlJFalA3bm1XSDNIT2VZUitRbnFXRXE0NmdRbFF3d0NHdzNNeGJIMU9kdXdi?=
 =?utf-8?B?Ykw3L1ZET1drOEU3dFFlWkVCYS9QeGlIUDVaSWg0T0VjUFo0ckhxRGdaSWVu?=
 =?utf-8?B?VFp5d3d5OVBhU0RFamFRL1VtbkxpYXBZa2htQmRsQ2hIajFZNGU5WlFLS0xr?=
 =?utf-8?B?OTZmYjdMQ1MyaXdHaVowR3VPU0RVMUFtWHROVGxMS0tHdlRwOWltVFZYbmRH?=
 =?utf-8?B?bkVkaEk3ZWdtM1NGQ2RZZ1BVaXM4VHFFek9CQnZKNko3WnVFNmhqSmhkMEMz?=
 =?utf-8?B?ZW9SQTFiYWN6SDBWdkFDVEc3YkFMajRNbDFCVC94VG1WRUdVK1BNL3Fac2s4?=
 =?utf-8?B?VklhQ3R4UExrekp6S2s5T1lPK0FGd3pOcDhrbFN5VU1paEFXOU5HTzFHZ1pu?=
 =?utf-8?B?VVdNZTRhUEEyVWdreE0vVmFqQjVISTZ4NEZOdkh0bnN6NGZKRHpEZWkyOWpV?=
 =?utf-8?B?VTlZNkt2RmNkS2E2bG1GWldJc254ZHhoRytDSUozY2JhS0JFbjJSTDJaZmsw?=
 =?utf-8?B?d2dsNlpvdVI1SjMvSHFPZGd3cnlERWUxVmZMYzE1ZFBqZVlEZFNRbzN0RjBR?=
 =?utf-8?B?YXM0ZEh5NHc5YVNSbmxRYUkwZUc2d3BNMEJ0anNaZG9aa1ROdTB2N0NGcVJP?=
 =?utf-8?Q?WzyUmW5k7iyWuyQRUw=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6ea25.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cf36ffd2-3f3b-4649-5435-08da9fc96c33
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3236.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:14:28.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5691
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
Cc: openbmc@lists.ozlabs.org, "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>, naveen.mosess@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000036632105e995113c
Content-Type: text/plain; charset="UTF-8"

The host Selector object is not strictly required. The host selector object
check was only added to identify if the system is single host or multi host
system based on host selector availability.
Thanks.

On Mon, Sep 26, 2022 at 12:58 PM <zehra.ozdemir@inventron.com.tr> wrote:

> Hello,
>
>
>
> There is an isMultiHost() method to control to return true in case the
> host selector object is available in button-handler.cpp of the
> phosphor-buttons. And if it is not available, it does not return false and
> the project gets an error. So we covered this return line with try catch
> and it works.
>
> But my question is, does this host selector object has to be strictly
> defined for the project to run properly?
>
>
>
> Thanks.
>

--00000000000036632105e995113c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv dir=3D"ltr">The host Selector object is not strictly required. The host =
selector object check was only added to identify if the system is single ho=
st or multi host system based on host selector availability.<div>Thanks.&nb=
sp;</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Sep 26, 2022 at 12:58 PM &lt;<a href=3D"mailto:zehra.ozdem=
ir@inventron.com.tr">zehra.ozdemir@inventron.com.tr</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg4810837=
211167830977">
<div lang=3D"TR"><div class=3D"m_4810837211167830977WordSection1"><p class=
=3D"MsoNormal">Hello,<u></u><u></u></p><p class=3D"MsoNormal"><u></u>&nbsp;=
<u></u></p><p class=3D"MsoNormal">There is an isMultiHost() method to contr=
ol to return true in case the host selector object is available in button-h=
andler.cpp of the phosphor-buttons. And if it is not available, it does not=
 return false and the project gets an error. So we covered this return line=
 with try catch and it works. <u></u><u></u></p><p class=3D"MsoNormal">But =
my question is, does this host selector object has to be strictly defined f=
or the project to run properly?<u></u><u></u></p><p class=3D"MsoNormal"><u>=
</u>&nbsp;<u></u></p><p class=3D"MsoNormal">Thanks.<u></u><u></u></p></div>=
</div></div></blockquote></div>

--00000000000036632105e995113c--
