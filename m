Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F92EB00A
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 17:29:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Hy21bc4zDqc9
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 03:29:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.98;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=iwtrlb17; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2098.outbound.protection.outlook.com [40.107.94.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9HwZ4xJczDqCg
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 03:27:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj4f1tTW3gkfuejzt1OOTpFP7ba8AyX7CDXr6h8DWqYUamiKEXIr8pF7ZZCMR/ArX4Cwkrl2E0j6zN7mhBA8QuTUJe9tAzDe5PjR/+ia9T08RvNzTRY26En8omnFe1G++oVOZgThpi7emB4ge4k5VhGCZqfPKj2YIA0DKG9sE7ej2tL4U416tMsasIf6kRz9tFMkgOWqApMlO/FvHo8FXueGjJ/94nR2yJ2y1j5hmiiIZrohbQKYkYsDKq6Srr6z6IuRFQKH29Jogz9QDIgdH+Bbln23Czoa6yaVFbymZzw8xTYb9Fgfe/T+4AwaNnmMBX0iYD03AhtuRe1XVICWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jISsfeakGBsSjhXT/RDny4E+P4OZyhPBvYtDKCKCh7w=;
 b=F0c6YGPSLxRFUj4yLzwhiUmC+Sh7EmLuNYWpUaqyw8RdcATcHbkgYnie/SKDquMw46xvFYM+whkJLNILcO3oXeFGXql6NZ1T+d8H1OzK1vnAM2XBW1L4PL4UA4ieAV9d90wLzB6t3FkV4V351h16e3r8S2k3crCQO/lciNiXas86HVOxeyqcXneptotreIrBkHh44U+FNlPh6Oer9tfTot3ycK4yocOT4JWVSJkn3+PlzZTmXlIiwzAkUjNbTZfGRbP32/nSDJjLi3acz0XPCsgl482Eur7k5uHUm1BTefuXxmSaEbqs2XXkOSNAXjIIr87Lt84r2g5gkR9yWvTpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jISsfeakGBsSjhXT/RDny4E+P4OZyhPBvYtDKCKCh7w=;
 b=iwtrlb175ta5Y1//9JqGBr6OvkOmt6woSx1dKUyLm/Q37B7LEzTdlcgH7JUsMMK75XKI/0JHvN2x0pExZVvtAl2JrrwdzMIGRUpYcu7KuWQvRHJGno+14hwU1VA2KMtTGzmD8zomd+QLijNIrTMo7Sl6ZbaedZJqt6Kc7xfEmYE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4506.prod.exchangelabs.com (2603:10b6:5:78::29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Tue, 5 Jan 2021 16:27:51 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57%5]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 16:27:51 +0000
To: openbmc <openbmc@lists.ozlabs.org>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: GPIO pin is reset to default value after release.
Message-ID: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
Date: Tue, 5 Jan 2021 23:27:43 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2402:800:6344:4074:9099:43f0:cd20:866b]
X-ClientProxiedBy: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4074:9099:43f0:cd20:866b]
 (2402:800:6344:4074:9099:43f0:cd20:866b) by
 HK0PR01CA0056.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 5 Jan 2021 16:27:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c65a2815-3e5c-4042-fd28-08d8b196d8d9
X-MS-TrafficTypeDiagnostic: DM6PR01MB4506:
X-Microsoft-Antispam-PRVS: <DM6PR01MB4506B83C79C1B5264746990D90D10@DM6PR01MB4506.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrV45K2LnJIeMhWwo4c6+ONY75SFNlVK3lkTL0OEPx7fbEYt8i7u6v2HHgS2KF/1drMomZq06Thck1OCDZ2l8eSzkTTYasR4gtkneH3Y+rPsbtIyGfagWsJ55Gz8/TDASAKW1/LHXNyv4f8Cl6p7BIeN+zd3haup/ZW+RuHbQ0EuNxo0D1NAkCU21NugC6DpGOyTMpkZsbKjtEzvKEpQdI8QwlTPeEa5l2Uk1+dBOozZPIF6HV9FjNYCoGytHIRV8iq9fm3Ls6gPnoSx5mJtmka/U2D7Bmr3Lw7A3aZ6rJBYy6PtsGGDTGatfI56VMtEexphXhdbrJqJw8KGgucDnnh7tTn4u+zMLYL+xRVw9BE+RygRzhUI6b/u6md0Tqmqfzv06FHf9cm0rasBbZOYvsm5leuLxG9pTXj2hTTSZU+nggKg86/xJHUnCxcDnLts
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39830400003)(396003)(2616005)(6666004)(42882007)(186003)(2906002)(6486002)(478600001)(8936002)(4744005)(8676002)(316002)(31686004)(83170400001)(66476007)(66556008)(52116002)(31696002)(16526019)(6916009)(66946007)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTZyTVlPNFRkN3VYYVJERmFQN09BYmpzVm51cVNIajhwMFh5Y2hMNnR6NVlv?=
 =?utf-8?B?cHVEejJWSUxrVDI4aTV5dGNsNWJxQWpGdERhQ1djcDArRks0YTV6RGFZWTI1?=
 =?utf-8?B?RVczcnZKd3YyTHZFMVNvWXV4WUhoYjhQV25sWVc0QU0wbWNERkErWmM2Y0tk?=
 =?utf-8?B?WXhHZTZzc1hIRlY1NWg2RDNwaW5jZkN2U0pMNUhTd1JlM3lPTmVSUTlLWnVy?=
 =?utf-8?B?YWNwbThkZEVWVDN4Vy92MUZFUjBUYm9ncTFNeVVmdnBVWkxkSEtMWXFoM3R3?=
 =?utf-8?B?cDdMeWRHWGxPaHM1K3ZVTU8zM0ZtZ2xnRkZJNnhRblNoRW9CTU1qa2ljUVVY?=
 =?utf-8?B?QWdrNVQ1c1RxbjE0UGtNRFFvRkxTQmlFYlR5RDBycHNZSjlCbjVMaDhORVRu?=
 =?utf-8?B?bFNYRDNDY08zMlZzSGp1Q2pvQ1NBYjVTMVh1NTY5cFIvZHlYbkhSNUoxYzA4?=
 =?utf-8?B?L1FHZ1o4WGplck5MVUYwZWZtS1hhVm1GQVpmU2NLYk1ISXJMMmFJZ1BoZWRE?=
 =?utf-8?B?cVYzOGVHNmU2RjlYT1drbUpuUHdVRzUvQllLYTNhbnBWaHJCc1NWaThKVUpL?=
 =?utf-8?B?dStueVkxQUNkNTJBQmJmc0pzL2xnZFRtb1liQXpGM05ydnR6Y1BORHhuOFZa?=
 =?utf-8?B?SEZzRDNPRUdSYm1xY0N3aEdEL1hLTXFXS0tHZ2h5b2hVaDhWTTVPRVIxL2FK?=
 =?utf-8?B?OFIxL1pKeGFOTzU5dVZjbjhqekFWMXNXV014em4xZHhTdjdHQ1lvODZVUE1N?=
 =?utf-8?B?MXFYTDFWUWJsdnhSaUw1dDlUQXFxWGl6eTVZMitjenJOdzJwOWFMMXRQNDdF?=
 =?utf-8?B?RGxXeDZqUGpRTlZycWZaY2luQzBqdkh6NHRWZXhOcW9tVmJvNXlWQzE0RzI2?=
 =?utf-8?B?NjFOUEN2RFZrSHJqTHJuYTE1TTJ1aksvYTB5a1lIWG1BRnc5VVdKZEJ4NDNZ?=
 =?utf-8?B?MEdpbE5pRlBMM0RHWHZrMVR6bzRlaTJ4b3lIUmo4cDZXNDd3RkJqekhNcGFz?=
 =?utf-8?B?RklzOG9QTnRXNURrRVVrWDFZeS9xcGtSNEpVREc5N1ZPZ0kySW9IQStFc0Ir?=
 =?utf-8?B?UWp1K1VNSDU3ZEdMZDhvdmwvekFMUnoxRjBnVFlMbWZKVWNNazd2NkRZdDdz?=
 =?utf-8?B?R1plbGUyQVBrREhlaStQd3kzZk5yTjlzY0RURktaSTdoaG5JcE9JYldHamY0?=
 =?utf-8?B?cVBrbEVyUlpNR2lQbjkvM00va051LzROU3c4aUhJdGhkVG9xTGpLblA4ZDVX?=
 =?utf-8?B?MHFMTTFSaVpTczRQSm9keUhqenRCYUdKb2t2OUhNNzVDOTVySFA4VFdWWEdj?=
 =?utf-8?B?WkJzZHVjSUVSaVgrNVdSZGhsTFBLVmhtNXZrbWRrOWhHdHd6a21qelp5YTZi?=
 =?utf-8?B?NFRJZHpGM3BtOWlJR0pnUXJBV1lXdUNlbjhnaWhiYk8rN2Z3eWlVWXllVHpq?=
 =?utf-8?Q?eTgDQDrg?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 16:27:51.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: c65a2815-3e5c-4042-fd28-08d8b196d8d9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q11mfW52PEk3Zi2t/CZf1H0U3pkVpzqMIs16vY5uKG2lElsW7gKjUj7ezhYmTH14GMC0iFWaSMb5Gt/FcfEaBILQwSjYsN96swkSZSxRUmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4506
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

Hi,


Current I'm using two difference GPIO libs gpiod and gpioplus to setting 
GPIO pins.

I can set the GPIO pin to expected value in a service. And GPIO keep 
unchanging when the service is running.

But when the service is exited, the GPIO handler is released then GPIO 
is reset to default value.


Do we have any gpio lib which don't reset the GPIO when the handler is 
released?


Thanks.

Thu Nguyen.

