Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CAA280344
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 17:53:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2HjJ6YCCzDqZj
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 01:53:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.113; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=eGzCiSix; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=eGzCiSix; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320113.outbound.protection.outlook.com [40.107.132.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2Hgm5TtrzDqYB
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 01:52:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbVOC4aDP5uvpzNKzYJSWMkXBklR8BJU/zsjAq1fEzw=;
 b=eGzCiSixfG/SSV6DVH4A7H4uwyTPGKGZ2nVHAV8Iy3TZUVUFJ9Md3L+gjW0U8oyNlc6Kxi+0KP0HDGzsoQed5FTgeifSE/l1nqWJrkoAOtMr4LzZm11hNVzNC0HgIleNo3iKtdJ93CUXBAyv0EeoicB0WJvsw/yoOBtTN2V4Q/A=
Received: from SG2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:3:2::30)
 by TY2PR04MB3647.apcprd04.prod.outlook.com (2603:1096:404:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 1 Oct
 2020 15:52:11 +0000
Received: from HK2APC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:2:cafe::36) by SG2PR0302CA0020.outlook.office365.com
 (2603:1096:3:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend
 Transport; Thu, 1 Oct 2020 15:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; linux.ibm.com; dkim=pass (signature was verified)
 header.d=HCL.COM;linux.ibm.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT041.mail.protection.outlook.com (10.152.249.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 15:52:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYFsRPpffur+c6maU46HGKXK6WOruppi+oUbSWKvwQSY++imxkYheNK7FXgGN0cnbLxMrnVsm4Jc3nfCWYOSupQJ0pMAAD5AtZAaFrnzp2C1GCF+f2RSdBMsjGRLBuK+O4P7pbnqY5h4YzhE5xJNjke8++JKlEeET1QPfKFkWCz6iPRlJ9SzyVR2RMbXw2kDo0iIErxB5Am6GkLqlBvsvo4O/HQvXEDgYNaCaUilmKFURTVx02NP6OFe9LiW6yQ2VjOhOIIVGsw8yqmqOEB8KXjV8/OCIGoVB3q8uJx97e93bs7TDW5tQwhRxOCbzeRxPl6dpyn5sMppK29p69CbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbVOC4aDP5uvpzNKzYJSWMkXBklR8BJU/zsjAq1fEzw=;
 b=Xk0/08bQYk4Qg6AvWOpVLB81Fes5SKf2wTchFlwjnSK1eLlz23zKFJdyw9FbM8wbiR8w0WHJgXdc1Q4NTgtO3wDtRJbixrhvurxbgFZO/W6ZMKuWo/fgJgN3EnsV97aGKFYd+mPmiBD4/ldWoHmothVOny4GqDg+54FAM8ZACI7bkvsX+TpM4OzdFAH9oz96WCfdlCku47RCVI7l6C2+FjJcvZSmXzVzDuCdyw/omyBKf9pBBONQcazkehq17AyaDu5hEWHR27EVkqxFktOgU7m/QUbDy0myLfkVdmhB1DEfbGNgEArbzppMxMd+SX+VuquzPRfoJf0k1d6ZAK3axQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbVOC4aDP5uvpzNKzYJSWMkXBklR8BJU/zsjAq1fEzw=;
 b=eGzCiSixfG/SSV6DVH4A7H4uwyTPGKGZ2nVHAV8Iy3TZUVUFJ9Md3L+gjW0U8oyNlc6Kxi+0KP0HDGzsoQed5FTgeifSE/l1nqWJrkoAOtMr4LzZm11hNVzNC0HgIleNo3iKtdJ93CUXBAyv0EeoicB0WJvsw/yoOBtTN2V4Q/A=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3565.apcprd04.prod.outlook.com (2603:1096:404:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 1 Oct
 2020 15:52:08 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3433.037; Thu, 1 Oct 2020
 15:52:08 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Adriana Kobylak <anoo@linux.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Topic: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Index: AQHWkD7TytR1qVyzD0a6ZilIwzzPvqlzfzwAgAAUMICAD2ExBQ==
Date: Thu, 1 Oct 2020 15:52:08 +0000
Message-ID: <TY2PR04MB33117717F809C0804A00B365CA300@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <20200921194614.GL6152@heinlein>,
 <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>
In-Reply-To: <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linux.ibm.com; dkim=none (message not signed)
 header.d=none; linux.ibm.com;
 dmarc=none action=none header.from=hcl.com; 
x-originating-ip: [2409:4072:6290:82b3:7d75:82e7:25f2:7f72]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 97cf8402-483b-49ed-9cd7-08d86621f57c
x-ms-traffictypediagnostic: TY2PR04MB3565:|TY2PR04MB3647:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB36471446F450F5B87F6E21A8CA300@TY2PR04MB3647.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9AEaAxLwSGb5vbtkto0tl0lYTgwAsVl6MDwlo75Dnsg8vZpJgjFfC7yQIWMk3HU5PF49zLwWGk++DvKpWEvQRFtuymoyMBqENYoIstOwvtmiX3AhPtdzi1JHc2PulQPqzpn6Ts85kKYa0a5EC6Hy9UiDZOejiO4h5WgpEDgr3vUMBuwJ2tyxjES1wduiIwQGdm7eyOFrXepm05GxP4RJq27SnPTBiqUEQynwhBAk0JIxG0d94bHHQ3M0y5XODBDd4EWdu1xRToKfqd8oGPV10uSFKZFO/Ro9LvvfrGU+8WnZ77Py7fJoo6uVbzLLSuTux6wxx0bTmPib4nnp9b4iOYRuftFqKDGDETHUXxu3eE+P+4M0XgnxtBHlSDgZhSfLAwpjMMCN8n8Rqs5O7EEIynhwpXZOtzENNB0DyPwfmV/5KXZuJwu3wFBkF3f3z2OMyr3fZ7gkdbQP1afB+wjdNg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(8676002)(45080400002)(966005)(186003)(33656002)(66946007)(478600001)(19627405001)(76116006)(91956017)(2906002)(64756008)(5660300002)(166002)(86362001)(66476007)(66556008)(66446008)(110136005)(83380400001)(316002)(9686003)(7696005)(53546011)(55016002)(8936002)(52536014)(71200400001)(6506007)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 23Aa7Lf85nHHVAAfZ2UR+J3aQukNiTb08Q5UXOYmBGHLwRQbapf8ITYhRa8dkYkikaC771ltqoctyeUr6T4Wq/fVouqtYtnC99fRyNAqash5w3HF3KpMy3P/RrsFN/4LN2BYI6EctskDiugW771M/U6atlKJfX8iS9I7kbUL/rx9dDZI1cUpb6Nk6ZvmcP/IEF9JPQmFD3L7FjD/cHM0BLPizjhsX/LKn7Szy9rQRFPD7p7lc9rBM/r+uwao8NR6cE9Lo+qWjpd2ajyiMS4xpRpEprz3ob9Fv2xG8aMahD+3POfPqpdu42BRXAk2utfDFo4v5aVbLZfiTlFFcbY3Sv6Bl4ZNJ84rSNnz/IbdcnmW+tGoyA9TYdq65y9f+NtjbLmunHAfDbwnK7HMxHgimfm/WMRqgfoa7Ob6IO2/7N57GPRUiaR1fqPgJKTULROWAT9s0gyK8e9DcoRUE98VhkaelfG6qp7dxRynwrHSdms51lRFlGoqM1NJNL5132lUfu8YXVkWI21gt+FYuuFXQqr9/9NVro0gMSZuKhHZ4GYxp3ivYWB3Wy7zGdHgIAFN4oPsnW5wwBqfJrn/Om+Gpqw/MkKf7Zj8YfscYe44A+LtolK8e8zr5gnsMsl/okJi2jFPlDI5fScH48NlaFfWC6u+mkSZiTEye3/XRMpKPQMmgwov5RAjCaUfzzdrXwtQSgOXKLKzsZ5/WM7aUE9M0w==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB33117717F809C0804A00B365CA300TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3565
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 03263a45-52ea-40b1-50b0-08d86621f3bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Asm4oLJWyqEkeA4e9FcXjlhWIv5l5B1hQOuQ8pPai50V2x63gUfTLIFp1WQ851hDFHYyPkfqQUMLwJ6Tf2RDTL0NGo9EzPNaKrfg3GF06cD2uEDkpSPQakFl7IhfwHNeMHD+QHkzyNoYjyAggvVcFo+rLPL886CtSDSE/cVSWoKKiuSDneluKfArRQ9GH4FJNKIE1eCDL6zeP0ql8CSPmnUjQe0RvpS590euJXjh3Uw4Y83n06Fypg+KvAI/q1J7fFJxRl0d/CvrCWZrJrF5Nfy6MvSI3Vn648MEtP+HsJR/lBkHH5hebouD5vcePcBuWZ/zyrE7raLWuESBUpHEB+W0U6Z4Q327yvrkPVQCcHIbHExXCobZTYxK/i7LbvEG8b6uwTZ3PFlLFgUSbLJAbt3m3yCd7kvMA0Rw5PsQjTK/vrB6Adn8UNEA2VGGks6bobLej3Vc4GgNUmgk1bCYDivz8GS1HtDsoxMex73OnDbPqk7aMsSpDUc+uXWdEDaIV8th17wXLdvzfzGmuWqWKOxUrVjc0t06m78jP8D7bzzvrypkHkKQcpKjyxncgXB
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(36906005)(316002)(7696005)(26005)(9686003)(45080400002)(47076004)(966005)(336012)(86362001)(53546011)(55016002)(6506007)(186003)(4326008)(70206006)(34070700002)(70586007)(54906003)(19627405001)(82310400003)(33656002)(8676002)(52536014)(8936002)(30864003)(83380400001)(82740400003)(166002)(356005)(5660300002)(81166007)(2906002)(110136005)(478600001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 15:52:10.4956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cf8402-483b-49ed-9cd7-08d86621f57c
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3647
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
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>,
 "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB33117717F809C0804A00B365CA300TY2PR04MB3311apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Adrina/Patrick,

Thanks for your comments. Sorry for the late reply, i was on paternity leav=
e for a week.

Adriana,
We understand that your changes for multi host (generate the id based on fi=
rmware version plus the device or volume) will look like

For single host (existing implementation will not be modified) and mentione=
d below,
       Dbus      : xyz.openbmc_project.Software.BMC.Updater
       Object    : /xyz/openbmc_project/software/[firmware_version]
       Interface : xyz.openbmc_project.Software.Activation

For multi host with same firmware version id generation changes,
        Dbus      : xyz.openbmc_project.Software.BMC.Updater
        Object    : /xyz/openbmc_project/software/[firmware_version]_[devic=
e]       where device could be host1, 2, ...,N
        Interface : xyz.openbmc_project.Software.Activation

We also expect that the interface (xyz.openbmc_project.Software.Activation)=
 will be created for each object (/xyz/openbmc_project/software/[firmware_v=
ersion]_[device])

Please confirm if our understanding is correct.

Thanks,
Priyatharshan P
________________________________
From: Adriana Kobylak <anoo@linux.ibm.com>
Sent: 22 September 2020 02:28
To: Patrick Williams <patrick@stwcx.xyz>
Cc: P. Priyatharshan <PriyatharshanP@hcl.com>; Sundaramoorthy Thiyagarajan =
<sundaramoorthyt@hcl.com>; Velumani T-ERS,HCLTech <velumanit@hcl.com>; open=
bmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; anoo@us.ibm.com <anoo@us.i=
bm.com>; ojayanth@in.ibm.com <ojayanth@in.ibm.com>; gmills@linux.vnet.ibm.c=
om <gmills@linux.vnet.ibm.com>; ratagupt@linux.vnet.ibm.com <ratagupt@linux=
.vnet.ibm.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

On 2020-09-21 14:46, Patrick Williams wrote:
> On Mon, Sep 21, 2020 at 05:49:14PM +0000, P. Priyatharshan wrote:
>>
>> Hi ,
>>
>> Phosphor-software-manager currently supports bios upgrade for a single
>> host.I would like to propose a design to add multi host bios upgrade
>> support in Phosphor-software-manager.
>>
>> Kindly review the below proposal and share your valuable comments.
>>
>> Design:
>>
>> a) : Add Host Number
>>
>> 1) MANIFEST file change:
>>
>> Add  host number in MANIFEST file, purpose field like below.
>>
>> Ex:
>> For Host1,
>> purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose.Host1
>> For Host2,
>> purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose.Host2 and
>> So on.
>
> These 'purpose' values align with the Purpose field in Software.Version
> (and the VersionPurpose enumeration).  We really don't want to add Host
> positions to this enumeration set.
>
> Why would a MANIFEST file have a different value for a different host
> position anyhow?  Isn't the appropriate firmware image for your host
> card dependent on which host-card-hardware you have installed and not
> which position the card is in?  The type of hardware should be handled
> by ExtendedVersion.
>
> I can't imagine that a 16-blade BladeCenter would want to have 16
> different files for each slot in the BladeCenter.  That doesn't sound
> like a great user experience.
>
>> 2) For bios upgrade, handle the same to incorporate the host number
>> and send host number to the systemd service
>> obmc-flash-host-bios@service like below.
>>
>>   if (host.empty())
>>     {
>>         auto biosServiceFile =3D "obmc-flash-host-bios@" + versionId +
>> ".service";
>>     }
>>     else
>>     {
>>         auto biosServiceFile =3D
>>             "obmc-flash-host-bios@" + versionId + "_" + host +
>> ".service";
>>     }
>
> It doesn't seem like systemd had a clear mechanism to create a
> 'multi-parameter template' which seems to be what you're asking for.
> We
> should probably define a convention for openbmc.  I'm somewhat
> surprised
> that versionId is part of the template parameters to begin with.
>
> I think there is a question you've missed (assuming we're not using the
> purpose field to identify which host): How do we handle activation for
> firmware images which can apply to multiple entities?  Today, as best I
> can tell, there is a 1:1 mapping between firmware images and inventory
> items they apply on.  At least, this is the case in
> phosphor-bmc-code-mgmt, which is where this code you linked to is.
>
> Reading the section "ItemUpdater" at [1], it seems that we can have
> multiple Activation interfaces for a single Software version and these
> Activation interfaces are expected to be associated to the
> Inventory.Item they manage.  This would mean that we should create <N>
> activation objects, one for each host, and modifying
> `RequestedActivation` will activate only for that host.
>
> (Adriana can maybe weight in here?)

Agree with what Patrick has said.
One current limitation is the version id is generated from the firmware
version string, meaning that it can't be duplicate d-bus interfaces with
the same version id.
One feature that I think will help with this multi-host scenario is that
I'll be pushing up a change for review to generate the id based on
firmware version plus the device or volume where the firmware version
resides, thus allowing different multiple interfaces with the same
firmware version. The use-case is to allow BMCs that support two
firmware versions to have the same firmware on both sides.
This can then be used for multi-host by creating an Activation interface
for each host even if the firmware image we want to install is the same
for multiple host targets, by using some unique identifier for each host
instance to generate the id.

>
>>
>> b) : Implement a generic IPMI based multi-host bios upgrade.
>>
>> 1) This generic implementation expects a json config file with the
>> details like IPMI net function , command id, and etc and process the
>> bios upgrade via ipmi commands.
>
> I'm not following how this is related unless this is the code inside
> 'obmc-flash-host-bios@'?  You're not expecting this IPMI function to
> dynamically create your MANIFEST, are you?  MANIFEST files need to be
> digitally signed when you're doing secure updates, so you cannot
> dynamically manipulate them.
>

The phosphor-bmc-code-mgmt repo manages out-of-band updates. Maybe the
IPMI flash repo[2] is relevant here? It has tools to do an inband update
through IPMI to the bmc and host.

>
> 1.
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenbmc%2Fphosphor-dbus-interfaces%2Ftree%2Fmaster%2Fxyz%2Fopenbmc_=
project%2FSoftware%23itemupdater&amp;data=3D02%7C01%7CPriyatharshanP%40hcl.=
com%7C230241680e504b3d447208d85e711c33%7C189de737c93a4f5a8b686f4ca9941912%7=
C0%7C0%7C637363187181175557&amp;sdata=3D4sGybP9lK0Xjuyds9rlyjuRtY8%2FY%2F6q=
MkDFP0hDhwaY%3D&amp;reserved=3D0

2. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fopenbmc%2Fphosphor-ipmi-flash&amp;data=3D02%7C01%7CPriyatharshanP%=
40hcl.com%7C230241680e504b3d447208d85e711c33%7C189de737c93a4f5a8b686f4ca994=
1912%7C0%7C0%7C637363187181175557&amp;sdata=3DyF2JTBCD6D2SAPcucHBQuiUnSeOxn=
pI%2BOx37yjAJylU%3D&amp;reserved=3D0
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_TY2PR04MB33117717F809C0804A00B365CA300TY2PR04MB3311apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"box-sizing: border-box; font-family: &quot;Segoe UI&quot;, sy=
stem-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-se=
rif; font-size: 14px; orphans: 2; widows: 2">
<div>Adrina/Patrick,</div>
<div><br>
</div>
<div>Thanks for your comments. Sorry for the late reply, i was on paternity=
 leave for a week.</div>
<div>
<div>&nbsp;</div>
<div>Adriana,</div>
<div>We understand that your changes for multi host (generate the id based =
on firmware version plus the device or volume) will look like</div>
<div>&nbsp;</div>
<div>
<div>
<div>
<div>For single host (existing implementation will not be modified) and men=
tioned below,</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;Dbus &nbsp; &nbsp; &nbsp;: xyz.openbmc_proj=
ect.Software.BMC.Updater<br>
&nbsp; &nbsp; &nbsp; &nbsp;Object &nbsp; &nbsp;: /xyz/openbmc_project/softw=
are/<b>[firmware_version]</b><br>
&nbsp; &nbsp; &nbsp; &nbsp;Interface : xyz.openbmc_project.Software.Activat=
ion</div>
<div>
<div>
<div>&nbsp;</div>
<div>
<div>For multi host with same firmware version id generation changes,</div>
<div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; Dbus &nbsp; &nbsp; &nbsp;: xyz.openbmc_pro=
ject.Software.BMC.Updater</div>
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; Object &nbsp; &nbsp;: /xyz/openbmc_project=
/software/<b>[firmware_version]_[device]</b>&nbsp; &nbsp; &nbsp; &nbsp;wher=
e device could be host1, 2, ...,N<br>
&nbsp; &nbsp; &nbsp; &nbsp; Interface : xyz.openbmc_project.Software.Activa=
tion</div>
<div>
<div>
<div>&nbsp;</div>
<div>We also expect that the interface (xyz.openbmc_project.Software.Activa=
tion) will be created for each object (/xyz/openbmc_project/software/[firmw=
are_version]_[device])</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"box-sizing: border-box; font-family: &quot;Segoe UI&quot;, sy=
stem-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-se=
rif; font-size: 14px; orphans: 2; widows: 2">
Please confirm if our understanding is correct.&nbsp;</div>
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Adriana Kobylak &lt;a=
noo@linux.ibm.com&gt;<br>
<b>Sent:</b> 22 September 2020 02:28<br>
<b>To:</b> Patrick Williams &lt;patrick@stwcx.xyz&gt;<br>
<b>Cc:</b> P. Priyatharshan &lt;PriyatharshanP@hcl.com&gt;; Sundaramoorthy =
Thiyagarajan &lt;sundaramoorthyt@hcl.com&gt;; Velumani T-ERS,HCLTech &lt;ve=
lumanit@hcl.com&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;; anoo@us.ibm.com &lt;anoo@us.ibm.com&gt;; ojayanth@in.ibm.com
 &lt;ojayanth@in.ibm.com&gt;; gmills@linux.vnet.ibm.com &lt;gmills@linux.vn=
et.ibm.com&gt;; ratagupt@linux.vnet.ibm.com &lt;ratagupt@linux.vnet.ibm.com=
&gt;<br>
<b>Subject:</b> Re: Multi host bios upgrade support in phosphor-bmc-code-mg=
mt:</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: This Email is from outside the Organizat=
ion. Unless you trust the sender, Don=92t click links or open attachments a=
s it may be a Phishing email, which can steal your Information and compromi=
se your Computer.]<br>
<br>
On 2020-09-21 14:46, Patrick Williams wrote:<br>
&gt; On Mon, Sep 21, 2020 at 05:49:14PM +0000, P. Priyatharshan wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi ,<br>
&gt;&gt;<br>
&gt;&gt; Phosphor-software-manager currently supports bios upgrade for a si=
ngle<br>
&gt;&gt; host.I would like to propose a design to add multi host bios upgra=
de<br>
&gt;&gt; support in Phosphor-software-manager.<br>
&gt;&gt;<br>
&gt;&gt; Kindly review the below proposal and share your valuable comments.=
<br>
&gt;&gt;<br>
&gt;&gt; Design:<br>
&gt;&gt;<br>
&gt;&gt; a) : Add Host Number<br>
&gt;&gt;<br>
&gt;&gt; 1) MANIFEST file change:<br>
&gt;&gt;<br>
&gt;&gt; Add&nbsp; host number in MANIFEST file, purpose field like below.<=
br>
&gt;&gt;<br>
&gt;&gt; Ex:<br>
&gt;&gt; For Host1,<br>
&gt;&gt; purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose.Host=
1<br>
&gt;&gt; For Host2,<br>
&gt;&gt; purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose.Host=
2 and<br>
&gt;&gt; So on.<br>
&gt;<br>
&gt; These 'purpose' values align with the Purpose field in Software.Versio=
n<br>
&gt; (and the VersionPurpose enumeration).&nbsp; We really don't want to ad=
d Host<br>
&gt; positions to this enumeration set.<br>
&gt;<br>
&gt; Why would a MANIFEST file have a different value for a different host<=
br>
&gt; position anyhow?&nbsp; Isn't the appropriate firmware image for your h=
ost<br>
&gt; card dependent on which host-card-hardware you have installed and not<=
br>
&gt; which position the card is in?&nbsp; The type of hardware should be ha=
ndled<br>
&gt; by ExtendedVersion.<br>
&gt;<br>
&gt; I can't imagine that a 16-blade BladeCenter would want to have 16<br>
&gt; different files for each slot in the BladeCenter.&nbsp; That doesn't s=
ound<br>
&gt; like a great user experience.<br>
&gt;<br>
&gt;&gt; 2) For bios upgrade, handle the same to incorporate the host numbe=
r<br>
&gt;&gt; and send host number to the systemd service<br>
&gt;&gt; obmc-flash-host-bios@service like below.<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; if (host.empty())<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; auto biosServiceFi=
le =3D &quot;obmc-flash-host-bios@&quot; + versionId +<br>
&gt;&gt; &quot;.service&quot;;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; auto biosServiceFi=
le =3D<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;obmc-flash-host-bios@&quot; + versionId + &quot;_&quot; + host =
+<br>
&gt;&gt; &quot;.service&quot;;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; It doesn't seem like systemd had a clear mechanism to create a<br>
&gt; 'multi-parameter template' which seems to be what you're asking for.<b=
r>
&gt; We<br>
&gt; should probably define a convention for openbmc.&nbsp; I'm somewhat<br=
>
&gt; surprised<br>
&gt; that versionId is part of the template parameters to begin with.<br>
&gt;<br>
&gt; I think there is a question you've missed (assuming we're not using th=
e<br>
&gt; purpose field to identify which host): How do we handle activation for=
<br>
&gt; firmware images which can apply to multiple entities?&nbsp; Today, as =
best I<br>
&gt; can tell, there is a 1:1 mapping between firmware images and inventory=
<br>
&gt; items they apply on.&nbsp; At least, this is the case in<br>
&gt; phosphor-bmc-code-mgmt, which is where this code you linked to is.<br>
&gt;<br>
&gt; Reading the section &quot;ItemUpdater&quot; at [1], it seems that we c=
an have<br>
&gt; multiple Activation interfaces for a single Software version and these=
<br>
&gt; Activation interfaces are expected to be associated to the<br>
&gt; Inventory.Item they manage.&nbsp; This would mean that we should creat=
e &lt;N&gt;<br>
&gt; activation objects, one for each host, and modifying<br>
&gt; `RequestedActivation` will activate only for that host.<br>
&gt;<br>
&gt; (Adriana can maybe weight in here?)<br>
<br>
Agree with what Patrick has said.<br>
One current limitation is the version id is generated from the firmware<br>
version string, meaning that it can't be duplicate d-bus interfaces with<br=
>
the same version id.<br>
One feature that I think will help with this multi-host scenario is that<br=
>
I'll be pushing up a change for review to generate the id based on<br>
firmware version plus the device or volume where the firmware version<br>
resides, thus allowing different multiple interfaces with the same<br>
firmware version. The use-case is to allow BMCs that support two<br>
firmware versions to have the same firmware on both sides.<br>
This can then be used for multi-host by creating an Activation interface<br=
>
for each host even if the firmware image we want to install is the same<br>
for multiple host targets, by using some unique identifier for each host<br=
>
instance to generate the id.<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; b) : Implement a generic IPMI based multi-host bios upgrade.<br>
&gt;&gt;<br>
&gt;&gt; 1) This generic implementation expects a json config file with the=
<br>
&gt;&gt; details like IPMI net function , command id, and etc and process t=
he<br>
&gt;&gt; bios upgrade via ipmi commands.<br>
&gt;<br>
&gt; I'm not following how this is related unless this is the code inside<b=
r>
&gt; 'obmc-flash-host-bios@'?&nbsp; You're not expecting this IPMI function=
 to<br>
&gt; dynamically create your MANIFEST, are you?&nbsp; MANIFEST files need t=
o be<br>
&gt; digitally signed when you're doing secure updates, so you cannot<br>
&gt; dynamically manipulate them.<br>
&gt;<br>
<br>
The phosphor-bmc-code-mgmt repo manages out-of-band updates. Maybe the<br>
IPMI flash repo[2] is relevant here? It has tools to do an inband update<br=
>
through IPMI to the bmc and host.<br>
<br>
&gt;<br>
&gt; 1.<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fopenbmc%2Fphosphor-dbus-interfaces%2Ftree%2Fmaster%2F=
xyz%2Fopenbmc_project%2FSoftware%23itemupdater&amp;amp;data=3D02%7C01%7CPri=
yatharshanP%40hcl.com%7C230241680e504b3d447208d85e711c33%7C189de737c93a4f5a=
8b686f4ca9941912%7C0%7C0%7C637363187181175557&amp;amp;sdata=3D4sGybP9lK0Xju=
yds9rlyjuRtY8%2FY%2F6qMkDFP0hDhwaY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fphosphor-dbus-interfaces%2Ftree%2Fmaster%2Fxyz%2Fopenbmc_pr=
oject%2FSoftware%23itemupdater&amp;amp;data=3D02%7C01%7CPriyatharshanP%40hc=
l.com%7C230241680e504b3d447208d85e711c33%7C189de737c93a4f5a8b686f4ca9941912=
%7C0%7C0%7C637363187181175557&amp;amp;sdata=3D4sGybP9lK0Xjuyds9rlyjuRtY8%2F=
Y%2F6qMkDFP0hDhwaY%3D&amp;amp;reserved=3D0</a><br>
<br>
2. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgithub.com%2Fopenbmc%2Fphosphor-ipmi-flash&amp;amp;data=3D02%7C01%7C=
PriyatharshanP%40hcl.com%7C230241680e504b3d447208d85e711c33%7C189de737c93a4=
f5a8b686f4ca9941912%7C0%7C0%7C637363187181175557&amp;amp;sdata=3DyF2JTBCD6D=
2SAPcucHBQuiUnSeOxnpI%2BOx37yjAJylU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fphosphor-ipmi-flash&amp;amp;data=3D02%7C01%7CPriyatharshanP=
%40hcl.com%7C230241680e504b3d447208d85e711c33%7C189de737c93a4f5a8b686f4ca99=
41912%7C0%7C0%7C637363187181175557&amp;amp;sdata=3DyF2JTBCD6D2SAPcucHBQuiUn=
SeOxnpI%2BOx37yjAJylU%3D&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_TY2PR04MB33117717F809C0804A00B365CA300TY2PR04MB3311apcp_--
