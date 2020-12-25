Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D32E2950
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 01:29:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D279C6mXBzDqNx
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 11:29:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.75.113;
 helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=pfiUfqlP; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750113.outbound.protection.outlook.com [40.107.75.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D278V1HgqzDqLh
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 11:28:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwdkFRZ7udt4bE+MapL6ORBLIYdgSVpZCNuNe9Cbw1FixDHgI6DPp0nbxky6jbMBe6nj23T3n64/VWNJIJnomla5gm76FCPOvYyWLDbjpdbznDp9ECUYDpSkdH4yZvDZQqehkTGc3Y13Udxgy9Ix097LExOLJYbhA5ZLF0yJm8/IfdehuBxYeApVOZ/bZH14T/BYTw0/6yTVWkGHqC8QR388udQZwi3TfExc1MIbrxMsHQg0SLUF8LQ+LcEnBBisb+n5IvWSzJdQWVqD+0FMjkt+yRlEP8uitjF/U42huFL7EvPKBp7LRubiA49p9b7qQxN7FdyNR1jd7wBCwR7LEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHaAM27G8FN5uOZM9z2LhP8EjSqFd+GRBq4K16s9RtY=;
 b=fTzHbf9ua0RIv7+McwLs39ZdMrQsIXG0OzLS3AZIP7zL9Zmxwli736Jl6r51QYDrqHLB2mnyKmY4VydvDcA0zvJ93emJS+JnWM+X+PA5aUqhnBSEx+5FyrfBUcnsJk+re4qLrI/ykjT1M8SNydq8tbhnJXtcKOVs3ksbN2BegEzDxKMlRFXJhU74EBG0tc1/AnROILLqUnSn3GJWQ593iArz7/5zdCpJ7iAaDIEZvyq7m5yTx6wkUrBX7f5Xh1JTbnAZCj5gTPUhBp/HJ3cywC2J+Z7KAoqtnAdCoD74+QLf2vKam6BR6IYSmEJhO0Kiq/JlxecsUsigx8PGrT821Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHaAM27G8FN5uOZM9z2LhP8EjSqFd+GRBq4K16s9RtY=;
 b=pfiUfqlP6+ezi1fTkHzjEXjpHWMq/Od47oHS1Iwk9jzLNkZ+cChlnZ54UPmHlhXtzpPbUBVI05Y8eT2jMr1RAPK4m44OYgBLCBwngvXvbBWbLZKUrRHEW8e3mGmzfK+LCXITfJjF2V0UA0cwUvxZb4U364hd9XAA+rSIrZIWb4E=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR01MB2329.prod.exchangelabs.com (2603:10b6:3:b::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.25; Fri, 25 Dec 2020 00:28:14 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57%4]) with mapi id 15.20.3700.028; Fri, 25 Dec 2020
 00:28:14 +0000
Subject: Re: Sensor Details
To: Jayashree D <jayashree-d@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <21370afc-0894-a53d-cc30-0351f507ed13@amperemail.onmicrosoft.com>
Date: Fri, 25 Dec 2020 07:28:03 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------A87DE0378D7AAFD5D8E0BDCE"
Content-Language: en-US
X-Originating-IP: [2001:ee0:56b9:8700:7477:760:9cce:2ede]
X-ClientProxiedBy: SG2PR06CA0244.apcprd06.prod.outlook.com
 (2603:1096:4:ac::28) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:ee0:56b9:8700:7477:760:9cce:2ede]
 (2001:ee0:56b9:8700:7477:760:9cce:2ede) by
 SG2PR06CA0244.apcprd06.prod.outlook.com (2603:1096:4:ac::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Fri, 25 Dec 2020 00:28:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fa77390-7a48-4388-0cde-08d8a86bf800
X-MS-TrafficTypeDiagnostic: DM5PR01MB2329:
X-Microsoft-Antispam-PRVS: <DM5PR01MB2329C6F3B10BD2A54C7CB80790DC0@DM5PR01MB2329.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVjMpz3EggWf8w59fwIvoSPjbv1GaWotoIkfzDPZJHczTpef+W2Qm1k9OoumufnbliVya0sPLBwrutKk/mQY2VIlpowe3iBEP2padpb/2G0C07EJSCoLfmoAQyPaZd38seEL1N/og8vRYYVGjpSID8wSEHVYDcDpt+AAkWuK8qefqWUx9Wp96D9XZdod7hxPqUDoHROD4UTgKxU6in2BGQXlXtondWOkmxhPqHTxq1f+hpYUJU6+kqfDplLq4sq8TvTdhD3rfvqqmje/AUHD5d4QwSL4WWhEV34jLuJX+KqVZrbA1tq3LziCs2dgpTw4MAeKNprHzlE5pdwyzESwG3GdUUMDU8lT78SjSV6Edf3tW3sRsgQTaz3LLbBdC9R7CY0wLUzB4OfPEngcrE7EbqGSQLVEI7FjcyLeyj3+JXufK2lAozD0bjfqt+2KS+mElG6SsaIHJWWNbLRFZjET69sC0xguOw4BEEnKwCzKR6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(83380400001)(66556008)(6666004)(66476007)(8936002)(6486002)(31686004)(7116003)(31696002)(66946007)(3480700007)(316002)(42882007)(8676002)(53546011)(83170400001)(2616005)(5660300002)(16526019)(110136005)(186003)(52116002)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?PcvHw5BH2WVQ7ZjhKDpccGXMVsuEo/Co8MZYWhiLeKECEaNHve1gQUkp?=
 =?Windows-1252?Q?WsI72BnOZcr/CfL/2jOein1TEPR2btuTUDoPVGg9m8vy4vERoo+jg2j8?=
 =?Windows-1252?Q?djBSK3HpWzDDDIBcNFN9ows3cAKvptLzXqqxzR9Gepg5lUyezHrHEVB8?=
 =?Windows-1252?Q?ejBkFI/aWpXX+vI7vVNNl8PTSPnZAB37351aWH2w7WNUWANGiPdcN5yO?=
 =?Windows-1252?Q?5H9whwUKM0FbP3DoZE+nrhSZ/SaPn+q1dILhzjmlg9+H6GntSXdAOUNg?=
 =?Windows-1252?Q?lxkf+Nu5txUMsbtUH5OtKXlf/nmB2N32yw4dX/uCbaRJJhvwjWIXzNsr?=
 =?Windows-1252?Q?tVuIPUY0r6ybc5qjNDhukU+dNCaPulq7b2u2DlrSmK13+x/5GM32SzJE?=
 =?Windows-1252?Q?uDPNFiK5DMZw0kTAXUsYHQOzZnKvBIDaIM6ujPzIIOTLsWnysAL5TP3O?=
 =?Windows-1252?Q?zFDaM0Oqbcgk6lGLOzv6ukzAybhgSnwD+X8wc4xB4YfIYQ1SMdMT0vgu?=
 =?Windows-1252?Q?mX+cp8s2I4ijFS/6/0YLiID9TAqMB46DZ+RBPm1v88AHp1dpOZ3QzFsA?=
 =?Windows-1252?Q?qMfc0DLHzCMPQ4jlqMI8Vdmtl0ipdn4ysH+aKB8RujThrwSwwpDQt4bW?=
 =?Windows-1252?Q?dupORULW5pKg3EcpckfXi3hBcmbJMUPR72LyWbdW2ptBJNs7cSRHDTVX?=
 =?Windows-1252?Q?IlC1Q4dkhpZQ2IkBOuX6lJRTx0lBEsgTtPWqqX4gumT+SfZJqNJuK7i9?=
 =?Windows-1252?Q?vdkKN6ulc2SdPxraGwUVgA7pOU4WsVMSj8OmkxKpV/uaQXJUHhx3hTTP?=
 =?Windows-1252?Q?riu7Q2YTmvwAXLhhSsxZ4xJKz5u5APvpYW5sQvWzjyGxpq5a9Od3cvMw?=
 =?Windows-1252?Q?UnCCfC58+IGBQTyYZAdg62emf+M6w7RJHeIGQWVrS+38leFAb3E7jNYC?=
 =?Windows-1252?Q?P03guBfY0qKVHD5kX88zsd0ezPBX3OeX5o0J//FhRQtoZrx4clc2RvLk?=
 =?Windows-1252?Q?mDqZs2Nlyx16KFCnP5vhfMHnY3Ay7Fu/NeM90wxIecInDn5PRtTMNblk?=
 =?Windows-1252?Q?FNnuqskQkUEUvu+OXiTkZw1MGCRqh8tkFwk/FaEmCvJQ2i2fRDp5oxTm?=
 =?Windows-1252?Q?fnaErjcRD/H62BGqzOKQHHxv?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2020 00:28:14.2828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa77390-7a48-4388-0cde-08d8a86bf800
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfxC0B7WBjCQCPo0PgNoVSy2/tYA4dUUyYImJltJsftxi2i/sEDQH3M1UEJyIs1iGp6fQH6mQ38trge4zLD5ZBuLy4bOmRsHhmahuzRNH2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2329
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

--------------A87DE0378D7AAFD5D8E0BDCE
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/20 22:53, Jayashree D wrote:
>
> Classification: *Public*
>
> Hi Team,
>
> Is there a way to get the details of sensor events like crossed 
> threshold/fault etc from any other service running on bmc (ex. 
> phosphor-led-manager).
>
> Please provide your inputs/suggestions on this.
>
> Regards,
>
> Jayashree
>
> ::DISCLAIMER::
> ------------------------------------------------------------------------
> The contents of this e-mail and any attachment(s) are confidential and 
> intended for the named recipient(s) only. E-mail transmission is not 
> guaranteed to be secure or error-free as information could be 
> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or 
> may contain viruses in transmission. The e mail and its contents (with 
> or without referred errors) shall therefore not attach any liability 
> on the originator or HCL or its affiliates. Views or opinions, if any, 
> presented in this email are solely those of the author and may not 
> necessarily reflect the views or opinions of HCL or its affiliates. 
> Any form of reproduction, dissemination, copying, disclosure, 
> modification, distribution and / or publication of this message 
> without the prior written consent of authorized representative of HCL 
> is strictly prohibited. If you have received this email in error 
> please delete it and notify the sender immediately. Before opening any 
> email and/or attachments, please check them for viruses and other defects.
> ------------------------------------------------------------------------

You can create the signal to monitor the properties of the sensor DBus 
object such as the threshold warning/errors.

When there is any event in signal properties the call back function will 
be called.

Then you can get the detail of sensor event.


Regards,

Thu Nguyen.


--------------A87DE0378D7AAFD5D8E0BDCE
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/24/20 22:53, Jayashree D wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal" style="margin-bottom:12.0pt">Classification:
          <b><span style="color:green">Public</span></b><span
            style="font-size:12.0pt"><o:p></o:p></span></p>
        <p class="MsoNormal">Hi Team,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">Is there a way to get the details of
            sensor events like crossed threshold/fault etc from any
            other service running on bmc (ex. phosphor-led-manager).<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">Please provide your inputs/suggestions
            on this.<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Regards,<o:p></o:p></p>
        <p class="MsoNormal">Jayashree<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <font size="1" face="Arial" color="Gray">::DISCLAIMER::<br>
        <hr>
        The contents of this e-mail and any attachment(s) are
        confidential and intended for the named recipient(s) only.
        E-mail transmission is not guaranteed to be secure or error-free
        as information could be intercepted, corrupted, lost, destroyed,
        arrive late or incomplete, or may contain viruses in
        transmission. The e mail and its contents (with or without
        referred errors) shall therefore not attach any liability on the
        originator or HCL or its affiliates. Views or opinions, if any,
        presented in this email are solely those of the author and may
        not necessarily reflect the views or opinions of HCL or its
        affiliates. Any form of reproduction, dissemination, copying,
        disclosure, modification, distribution and / or publication of
        this message without the prior written consent of authorized
        representative of HCL is strictly prohibited. If you have
        received this email in error please delete it and notify the
        sender immediately. Before opening any email and/or attachments,
        please check them for viruses and other defects.<br>
        <hr>
      </font>
    </blockquote>
    <p>You can create the signal to monitor the properties of the sensor
      DBus object such as the threshold warning/errors.</p>
    <p>When there is any event in signal properties the call back
      function will be called.</p>
    <p>Then you can get the detail of sensor event.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Thu Nguyen.<br>
    </p>
  </body>
</html>

--------------A87DE0378D7AAFD5D8E0BDCE--
