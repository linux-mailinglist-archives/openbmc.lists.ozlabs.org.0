Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACFC2DB984
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 04:02:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwg0b3gPRzDqLt
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 14:02:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.95;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=2KJCadM9; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2095.outbound.protection.outlook.com [40.107.94.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwfzy4s9DzDqGB
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 14:02:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxPgF54/FR2fK4TfJT3nLiou8vjr06gnJkvJipHq+lj6CVED1trrWXa43/Qy2pZgF7qkKPDm6pylFyYUBqI4qLzG0zX+Es7E+4zBJCZKB4GmWeSiiJufmek4nsFp0YbG3gnXVw4fDmh6oKeDtPOfa/VK0BpNCk5edoiDxYhA+J81pnYRffxj9+l3KzcUHio4keEd6d4RhsktYG5Z8GJ+1eKgMAzDkuIQUcLV7KskOVl3SZ4ZMv4N7bR60WIaHBOsVxxZmJ9iQnzpOc5fBLeJZ6VDe4xyEDBsE2Wu/DbqL2LGr+B/x4snh7UWZ88fMTdXTBT/zu+6+gC6071o/IyQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVsN2wzIiQHkhHqCmRKZf9IvWXn/XfYm31wJZweqGxM=;
 b=N5xNaoOb08RZf7J+UWvFcRxggGG+ReIlfku6LEeYgFk7Un0w3E57meoHWyQXudXfWjdbmT4N93guAV98Q2zEj/8ETmF2J9wPX7uVONRtjFvRUHl9LpGLuteuBwFcL9K7VyPssIhUkWw3FhZEzPqB1bvwT2p1jBBGkosqHEuh54rxoR1sptx7WMmUn+RHe5HcxFMOHAur+Id4ke2f80C/jumiua2l8DB3GYKZOj50YsPxVQISoFF/QEvWp6iCalfXgF6RcRgImeCIArekgDXbtMMO7ica6QAncVjQN1QrAfC7qhXNfQW/EOusFjP+BXwJd3tZqb9tZX3Qw4N37dYZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVsN2wzIiQHkhHqCmRKZf9IvWXn/XfYm31wJZweqGxM=;
 b=2KJCadM9evnvMkkWFt8r2j2Vo1/Cfdp5vAvRyknrwz7wewTg3T/wWAdsr3pwF+dO9SzDSybcx8GU83hm9Gam9sHcabgnDjx0ny9wya5e1N85xzP5Bh5KAz90e8+N28SpQtqtKVjI+sK2bZXr3F540HU3+4pL5tD8le//bFjwYvI=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB3692.prod.exchangelabs.com (2603:10b6:5:92::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.17; Wed, 16 Dec 2020 03:01:57 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 03:01:57 +0000
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: Phosphor-fan-present only update fan Functional for
 xyz.openbmc_project.Inventory.Manager
To: openbmc@lists.ozlabs.org
Message-ID: <5299ced6-5d6a-843c-4112-3d9fa34f3ae7@amperemail.onmicrosoft.com>
Date: Wed, 16 Dec 2020 10:01:50 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:c9::20) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.175] (118.69.219.201) by
 HKAPR03CA0033.apcprd03.prod.outlook.com (2603:1096:203:c9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.12 via Frontend Transport; Wed, 16 Dec 2020 03:01:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48e4e6b0-1ce7-4130-149f-08d8a16ef381
X-MS-TrafficTypeDiagnostic: DM6PR01MB3692:
X-Microsoft-Antispam-PRVS: <DM6PR01MB36924FAACA8564541B6D330690C50@DM6PR01MB3692.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6TTt6Y/G7Sly88h0SOg/ZztgMgWRS2bCbDLNSRAppouRgOP7hwWPcZGQb0+dM6ZNhb3zO8lrp/mmA8o868TRaIrxkDCWxP5e4aWg/MWANSKX7JWP2lRUbtw8hrDidwIHkEJXlPCnld0zzZLTwr6bb9sk0PQcYuVEiG38wKIZnTf58P02W+ENQxkvaz3angZLCbNNeNjt6iYE2d6Ayb4WgBMKXtbkej/HnkZ7kV18xwjFhq6L/DUR/cCeEdC4L23cH9ZsS3wFGa/0Y3ZpIi9QxkfzuOsV2AbQlb1B6BL09fmWPDXJfbaO/r3etf0YObv8RGnQPFVrXQ0HSmWtCi89oPCS3cNBm1NNBBajylaFRKVOhVS1hRUSQhtSd7IxpNjgMJwTa16KLtP5vRI9aHcSbERcjydIF7N0a49q3C0yPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(346002)(376002)(366004)(52116002)(31686004)(6916009)(26005)(16576012)(956004)(6486002)(42882007)(186003)(8936002)(8676002)(316002)(16526019)(2616005)(478600001)(66556008)(19627235002)(66476007)(31696002)(83380400001)(66946007)(5660300002)(15650500001)(2906002)(83170400001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: k5Y/LqrXBB3e57RCfMPDVbSRT0CmB5CRIwU8hpAWPLYHG2xrWPo4LqLC8LJOJC7LaRSN78Xn5R19VYXLiP9xW/RAaA+xR/yeD6DgDbpCFiYQs/TllaxC3N74fBkrk7DC7wPZkxnraNkDD6VyDMYCYZilop5FbguDgi+lgRue28LMj4fCi/paZG2FVagpSCrXc89kIhzHAy0RCb7MN2NtZ0oCro925kmXs5tTjOINFAjILG5zB0wGy7Q7/SxA2bSInS2nwI88biZxGZVM71hDa8xKp4htxjL9C3tCuSP9kDsU4pPNWmow53bc6Vzzrgv8W1KGjjZuVdORycA/gRq7ksTMVwVuHrCt26yLHgflPqRxIKfNwvH22//YStpLb4GDlNjuZjghjALwplQMZ4Owxbo9QMLTf3rW3l24ZhCUWKgwF4e55SYACmaKdSkF6i6o0gq4Me9zgdkY9taWSjAVnz/aGnE+zjqTCNLduKisgQz4eCv0cJkdFil1yFl1xzLqz6Bbq2Zrbbeqw7ScaQBZW+QfulzybvlD7iL0knK7hWdDOxwvay1NHlQHcFu26r2qnb72a4sGoR0U+/RtFA4x3OVFSh398S6ae2UyeoCF6I5E0rUaYrkuS4VoLgc8XOV8WXwEpc6PLpNKa3xKdM01g2aQ+YVQIOPBkRPme/O70kE0y+43K6JggY0Jglacm0PvXCw5P6p0IEUShoH8hdjt21YdJbRBOai9JO1yatiR/HoO2Fq7cBT8goXx8vIr0SM/0U6lCT/Vybv2zEcm7mZgssvIXOaO293ZaoLuWR9HfWJi6K1I5Rq5wx8XbzAiW7HMuRDeJWFgMtFI7EuxTEjpvvUFIiNlRDTAT/V+fA2dGM/QIThzT3J+nefz0qhiPXFlxfGMBBVM9qbA5QeE/4BefhFPczDi1oiH/fH9GTkfO04=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 03:01:57.4713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e4e6b0-1ce7-4130-149f-08d8a16ef381
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYAhdkm6zaaQA6owjc5Nougb4SViPWz895TxxbS52ZBJ1G3g+RiUT+fnnMn1kyzM51/Clh1SzOvJlw/TVGYxgi4kV31rr/eIc9B1rX9C7iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3692
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

I would like to ask about current behavior of phosphor-fan-present.

When I unplug one fan, phosphor-fan-monitor will only update the 
Functional Dbus properties of /system/chassis/motherboard/FAN3_1/FAN3_1 
and /system/chassis/motherboard/FAN3_1 of inventory interface to false.

But not for "/xyz/openbmc_project/sensors/fan_tach/FAN3_1" of hwmon 
interface.

Below is test log:

~# busctl get-property xyz.openbmc_project.Inventory.Manager 
/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b false
~# busctl get-property xyz.openbmc_project.Inventory.Manager 
/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b false
~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b true

Is this the expected behavior?

Regards.

Thu Nguyen.

