Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203E41BEE2
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 07:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK5DJ2KTPz2yfg
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 15:54:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=rBTh370f;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=rBTh370f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.90; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector1 header.b=rBTh370f; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector1 header.b=rBTh370f; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320090.outbound.protection.outlook.com [40.107.132.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK5Cq4W8Cz2xv5
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 15:53:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rg5rWpcfP5Yh5sPka9Xjw7eKr8JdVZxtMhXp8937OE=;
 b=rBTh370fLUxYraVJofcLF+qZfFqd3cY/wYxUNRcU0eRLYGu/9NrP9cTTGQvVt8T5Eb6HFpbF8syol+Klh5sYGHLovTQ1cJLqtW4ML7XVUC7vjXy0+JHFVcDY5gJ3nDVNh69L1wgrAWPdRn0Gho0QgsZpkI9GjVo599U7TtiHreiMj8f8ZgeVeFvHu+XgzVhNuqfCSJ1MmKO8izmVAvNuGjWQU/jRo66ris0+OFXaPAV6E+pkwmTOZ8GQ/ooG6Ky5Q43IbSEQe0RTlePR/6oErg+E5SvDkxMRQ27jfgD/5GFHTRx6eNQgeMz6UYif6/7odtvBkpoAFI3mG2vjLyXWPA==
Received: from PS2PR02CA0033.apcprd02.prod.outlook.com (2603:1096:300:59::21)
 by SI2PR04MB5237.apcprd04.prod.outlook.com (2603:1096:4:16d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 05:53:38 +0000
Received: from HK2APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:59:cafe::71) by PS2PR02CA0033.outlook.office365.com
 (2603:1096:300:59::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Wed, 29 Sep 2021 05:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.59) by
 HK2APC01FT055.mail.protection.outlook.com (10.152.249.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 29 Sep 2021 05:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFoQY3JyTHwq3vJE2c24YeCAtGZ9iPesZEAht+CHy85eFVRDzUYCOfxkmpfDyaLGmgC5pjp/fgxWAA0rWIWCy6m5n5/BoZalXcbb6xhT0v2dokp+volpzViv39icojmWY0ucQoxlfITXMisdPhi6SHHbdbS7/IDz06GpiedGXFYq4yp0KU/WtGOO9tep5J+pUPSzaCenKgjlXoAqa9R26VhNRkPegrwEJXDnwSkmrvRvijdZViFYfOxAkkdmNOo46dH6BaSuB1lX9862cH0tKLSd0Fvo4twY+AOjR9t7kj3M90JoqaRFQ4+t8nC1sC1Gua9YQj+h8/9+/zjp5nlp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0rg5rWpcfP5Yh5sPka9Xjw7eKr8JdVZxtMhXp8937OE=;
 b=obmQWPzuWSM39W1JrAGJd06Gb3vjgG63TkYoYsH7AG4/3yKSO6Ngr8OYt/XZttPOMP0lobitJmHj4P/dW6wWrReS4QTwZPmNYJO0dG6pjkYQc7ZXke0+btsL7/IQ2ul+SviwFOMuL2EtU0c3WTrqR9j1Oxvho/cUe92ry2GcISsgWLejspAugx0VcA/A7rbV6/1WwcZh6X7phs37uZH1lhaGZ0sLVqllDMt2kaH8fkl//o+ioH6Cdz9BY6RfyVnnJNlBg/LEYAnPb0lF8LZU92a79nO3QpQqS/TMFCn1PkrQ6nB64jbyRY6l47FO92qeR9Lj+FjnNFIUDMyHebrHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rg5rWpcfP5Yh5sPka9Xjw7eKr8JdVZxtMhXp8937OE=;
 b=rBTh370fLUxYraVJofcLF+qZfFqd3cY/wYxUNRcU0eRLYGu/9NrP9cTTGQvVt8T5Eb6HFpbF8syol+Klh5sYGHLovTQ1cJLqtW4ML7XVUC7vjXy0+JHFVcDY5gJ3nDVNh69L1wgrAWPdRn0Gho0QgsZpkI9GjVo599U7TtiHreiMj8f8ZgeVeFvHu+XgzVhNuqfCSJ1MmKO8izmVAvNuGjWQU/jRo66ris0+OFXaPAV6E+pkwmTOZ8GQ/ooG6Ky5Q43IbSEQe0RTlePR/6oErg+E5SvDkxMRQ27jfgD/5GFHTRx6eNQgeMz6UYif6/7odtvBkpoAFI3mG2vjLyXWPA==
Received: from PS2PR04MB3589.apcprd04.prod.outlook.com (2603:1096:300:5e::22)
 by PS1PR0401MB2123.apcprd04.prod.outlook.com (2603:1096:803:d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 05:53:33 +0000
Received: from PS2PR04MB3589.apcprd04.prod.outlook.com
 ([fe80::208f:4cab:28d3:b0cf]) by PS2PR04MB3589.apcprd04.prod.outlook.com
 ([fe80::208f:4cab:28d3:b0cf%3]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 05:53:33 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: EEPROM Validation issue in Fru Device.
Thread-Topic: EEPROM Validation issue in Fru Device.
Thread-Index: Ade0hYZQ1eWZ+jg9QxKHfDi/VhnCMwAcK0JA
Date: Wed, 29 Sep 2021 05:53:33 +0000
Message-ID: <PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
References: <PS2PR04MB3589B9346947C693802AE1F7FDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
In-Reply-To: <PS2PR04MB3589B9346947C693802AE1F7FDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYTlhM2RjYWYtODQ2Ny00NjQ2LWJjNDEtMDc0MjhjMzY1YjMxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InVObUd1WjJleERcL1FjRnZhQXBEOXZQNnloMTFZejlIUmlMNGl5T3V0bmJjMUFzM1ZXaXZcLzB6MGdua0JwRDYwbiJ9
x-hcl_cla5s_d6: True
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 871f3c90-6e1f-4990-9d65-08d9830d7b23
x-ms-traffictypediagnostic: PS1PR0401MB2123:|SI2PR04MB5237:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SI2PR04MB5237998B54E0C4AE81E2F506FDA99@SI2PR04MB5237.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wFY6UY8cwKxHjwn3p4hQWQNPxWLUmtVPY7v7Sor7dpnXXpiHEnJWflaocOy3AEmVSeQYX4GJhPGUDM0OzFz4jtpq2ckm5UzuOAkE2pRiARe9h6u/hrLE7efFrNu14sBJb6TRKFhH+WVTFC7kMZI2Lhmd5QW1BE7RAgedypUPZnBrFEuADspXe7LxWTMHcsr3z/E/8CBpv/nc0nEHCEB+jOwiWpER7bMhOt2AiQpQj0aDPPZlWh3Sgx9ivTjifwhe6BkSuL0Ffpbktjeln04tjnuw9YyQhCvmgdZhaxVuLWVf2hcsX/xQ6bHRZzRWtsXmV6e5qDxaQtfnKSVCS9AAu6zqjjp8oBADtmXIc2Kg6XXlI2MGfLaeixKjCYfWQrCTi+seC4Txf+FjtbKhih4Tk3Y/pC+JdZ8cv5WDqhTyT94hyX2ZTs5vqzvAvI33HRcsSZUIWhug8KITVkXtncl4tbKKxpkVtgZzikT0ESk6gJ0Ly+NrJU0FycFMkWravojLSMBXymj1Kuo1f/eeRpIwd1WFi8lVjiJj6Hzeex24tHUb7VHD0zYk8UHWIY8n54rnkvrn7NaxOTMIla/rCEFA6k7h55ZL+p/ej/K2TUrl00XKC+QZ5W++thcglatq61aBxhr6jXsZe9FBRnn2W3vKhebYJVOy7nRNZPhpWg2gRuKVTtaoOREZ/lnAOQw9ahkya0qzEr/t+EsL3eSfOkXvHA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PS2PR04MB3589.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(54906003)(26005)(76116006)(6916009)(71200400001)(186003)(4326008)(2906002)(122000001)(8936002)(8676002)(2940100002)(38100700002)(66446008)(66946007)(83380400001)(86362001)(52536014)(66556008)(64756008)(38070700005)(9686003)(66476007)(6506007)(508600001)(55016002)(5660300002)(316002)(33656002)(53546011)(55236004);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99PS2PR04MB3589apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB2123
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ffe8ef9b-f427-46f9-ddfc-08d9830d78f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMvcYpIo9ro5vLLZNZM13ZBOb0pYP8jacdTu7ezPLK3r+96YhrkA2joZwVQPhBiOM9b+HgDL2/bdtywM+hmVptR6Y/BiuVktP9yi5PlgaIF/7Gyof5+4zFnlC6AyCMwsp2Hdpyi5XtEasTD9fGS7nadByqTnl0teKF2VzRbYUkP3O4F51+fgGx4jsLEn4VLKQwttSSWuuAc2+yK7ebqs0l9xhHLx43izfaRkzTuJRggriibTYDsKE4oU3f70t/EGMut9fRSVVXO7XbM067/8Qvcm4ccvR7tEkU1jfpiVlOqCDFpMnP8nMR8UCRLMjaUwhw59l4T+7dJaunuAN4Z8CJz1bQ1C6FOmMaijB3I6CWKP+PbkIs9lLMg762u5oJ28u+/CJsoWNMZvdQhQMH9AP7HFG4wFrrxKcdm3NIrTSKli8AjoUqCG/8MmlfYY1nyowotG36JDl1MW2hDEE1MGWYXekXt0Yw+ONZNHsVAOpHg0ghk+9NDAKX16SwXh+fyj1VhFDvtkL86xbql8N6qQiyzy+l7+/4K5iW3R9EBod5dik8lkug0GfYbjK3++hPA9t97EUWhi8lo7W/kvt8yGbUesKBRhseTVwJPL44DMQJmNOr1PxvoHVyZ3ISwxPFgLxqd+u+Egl0fcARLqZ9flQDLj5CickGN6gpzlYRFz8djpHxXuMaRO0+vG/5CqDJY3Gvm1SKRhk4LObK2gL7I9FDccKhdU/PWlSkiFQ87gxOM=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400003)(47076005)(52536014)(7696005)(53546011)(54906003)(6506007)(36860700001)(5660300002)(186003)(26005)(81166007)(336012)(2940100002)(508600001)(8936002)(83380400001)(316002)(8676002)(4326008)(70586007)(55016002)(36906005)(9686003)(6916009)(2906002)(70206006)(86362001)(33656002)(356005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 05:53:36.9192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 871f3c90-6e1f-4990-9d65-08d9830d7b23
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5237
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 Amithash Prasad <amithash@fb.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99PS2PR04MB3589apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Classification changed as Public.

From: Kumar Thangavel
Sent: Wednesday, September 29, 2021 11:19 AM
To: openbmc@lists.ozlabs.org
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com>; Patrick Williams <patrick@s=
twcx.xyz>; Amithash Prasad <amithash@fb.com>; Sai Dasari <sdasari@fb.com>; =
Ed Tanous <ed@tanous.net>; Vernon Mauery <vernon.mauery@linux.intel.com>; J=
ae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: EEPROM Validation issue in Fru Device.

Classification: Confidential
Hi All,

           We are working in FRU module that has 16 bit EEPROM and Wanted t=
o read eeprom data Via i2c.

           The below function in FruDevice.cpp in entity-manager validates =
8bit or 16 bit device.

           This function returns "0" for 8 bit device.

           This function returns "0" for 16 bit device also. But it's suppo=
sed to return "1" for 16 bit device.

           We have tested with our 16bit device. It returns "0" only.

           If we read via i2c utility commands,  getting all 255 data in th=
e first bytes.

           If we make code changes to return "1" for 16 bit device and call=
ed the function "i2cSmbusWriteThenRead",
           then we could able to read all the data perfectly for 16 bit dev=
ice.

           Code snippet :

            static int isDevice16Bit(int file)
                {
                    /* Get first byte */
                    int byte1 =3D i2c_smbus_read_byte_data(file, 0);
                    if (byte1 < 0)
                    {
                        return byte1;
                    }
                    /* Read 7 more bytes, it will read same first byte in c=
ase of
                     * 8 bit but it will read next byte in case of 16 bit
                     */
                    for (int i =3D 0; i < 7; i++)
                    {
                        int byte2 =3D i2c_smbus_read_byte_data(file, 0);
                        if (byte2 < 0)
                        {
                            return byte2;
                        }
                        if (byte2 !=3D byte1)
                        {
                            return 1;
                        }
                    }
                    return 0;
                }

    I2c utility command log :

    i2ctransfer 12 w2@0x51 0x00 0x00 r8
   WARNING! This program can confuse your I2C bus, cause data loss and wors=
e!
   I will send the following messages to device file /dev/i2c-12:
   msg 0: addr 0x51, write, len 2, buf 0x00 0x00
   msg 1: addr 0x51, read, len 8
   Continue? [y/N] y
   0x01 0x00 0x00 0x01 0x0e 0x1c 0x00 0xd4

  Note :

          We removed the EEPROM entry in dts file to skip the eeprom driver=
 and trying to read via i2c.

    Questions :

1.       How the function isDevice16Bit Validated for 16 bit device ?

2.       Is my validation and analysis is correct ?

     Could you please provide your suggestions on this.

Thanks,
Kumar.









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

--_000_PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99PS2PR04MB3589apcp_
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
	{font-family:Latha;
	panose-1:2 0 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.pl-k
	{mso-style-name:pl-k;}
span.pl-en
	{mso-style-name:pl-en;}
span.pl-c
	{mso-style-name:pl-c;}
span.pl-c1
	{mso-style-name:pl-c1;}
span.EmailStyle24
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
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
	{mso-list-id:419255600;
	mso-list-type:hybrid;
	mso-list-template-ids:-259504642 -169465916 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:30.75pt;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:66.75pt;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:102.75pt;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:138.75pt;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:174.75pt;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:210.75pt;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:246.75pt;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:282.75pt;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:318.75pt;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Classification changed=
 as Public.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Kum=
ar Thangavel
<br>
<b>Sent:</b> Wednesday, September 29, 2021 11:19 AM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;; Patrick Willia=
ms &lt;patrick@stwcx.xyz&gt;; Amithash Prasad &lt;amithash@fb.com&gt;; Sai =
Dasari &lt;sdasari@fb.com&gt;; Ed Tanous &lt;ed@tanous.net&gt;; Vernon Maue=
ry &lt;vernon.mauery@linux.intel.com&gt;; Jae Hyun Yoo &lt;jae.hyun.yoo@lin=
ux.intel.com&gt;<br>
<b>Subject:</b> EEPROM Validation issue in Fru Device.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#B45F04">Confidential</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; We are working in FRU module that has 16 bit EEPROM and Wanted to =
read eeprom data Via i2c.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; The below function in FruDevice.cpp in entity-manager validates 8b=
it or 16 bit device.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;This function returns &#8220;0&#8221; for 8 bit device.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; This function returns &#8220;0&#8221; for 16 bit device also. But =
it&#8217;s supposed to return &#8220;1&#8221; for 16 bit device.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; We have tested with our 16bit device. It returns &#8220;0&#8221; o=
nly.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;If we read via i2c utility commands,&nbsp; getting all 255 da=
ta in the first bytes.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;If we make code changes to return &#8220;1&#8221; for 16 bit =
device and called the function &#8220;i2cSmbusWriteThenRead&#8221;,
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;then we could able to read all the data perfectly for 16 bit =
device.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <b>Code snippet :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p><=
/b></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; static int isDevice16Bit(int file)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /* Get first byte=
 */<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; int byte1 =3D i2c=
_smbus_read_byte_data(file, 0);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (byte1 &lt; 0)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return byte1;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /* Read 7 more by=
tes, it will read same first byte in case of<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; * 8 bit but=
 it will read next byte in case of 16 bit<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; for (int i =3D 0;=
 i &lt; 7; i++)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; int byte2 =3D i2c_smbus_read_byte_data(file, 0);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; if (byte2 &lt; 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return byte2;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; if (byte2 !=3D byte1)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return 0;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; <b>I2c utility command log :<o:p>=
</o:p></b></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal">&nbsp; &nbsp;&nbsp;i2ctransfer 12 w2@0x51 0x00 0x00 =
r8&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;WARNING! This program can confuse =
your I2C bus, cause data loss and worse!<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; I will send the following messages to d=
evice file /dev/i2c-12:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; msg 0: addr 0x51, write, len 2, buf 0x0=
0 0x00<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; msg 1: addr 0x51, read, len 8<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Continue? [y/N] y<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x01 0x00 0x00 0x01 0x0e 0x1c 0x00 0xd4=
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp; </span>Note : <=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;We removed the EEPROM entry in dts file to skip the eeprom driver a=
nd trying to read via i2c.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Questions :<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:30.75pt;text-indent:-.25=
in;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How the function isDevice16Bit Validated for 16 bit=
 device ?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:30.75pt;text-indent:-.25=
in;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Is my validation and analysis is correct ?<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Could you please provide yo=
ur suggestions on this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:30.75pt"><o:p>&nbsp;</o:=
p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:30.75pt"><o:p>&nbsp;</o:=
p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:30.75pt"><o:p>&nbsp;</o:=
p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:30.75pt"><o:p>&nbsp;</o:=
p></p>
</div>
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

--_000_PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99PS2PR04MB3589apcp_--
