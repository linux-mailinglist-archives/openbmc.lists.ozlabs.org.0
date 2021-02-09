Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD4315231
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 15:57:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZmGL6YcjzDscm
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 01:57:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZmDF3CBFzDqqn
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 01:55:56 +1100 (AEDT)
IronPort-SDR: dHd2ndbho9sQKR/5QM0Dm5lqBU4LwuiaiJruzlLPaVAZinZ7l90S0PS5gp0IYY4kUFuI/2zrsp
 gTfV774/H0kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="178380316"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="178380316"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 06:55:52 -0800
IronPort-SDR: C566/sni7TEBledKYfVftt2cKu9dNnZdmNGq3CRy+qi2h9EQlJlq21rxUfnVJCk/uJbp3E+NN1
 dYQ1NzlKpaFQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="586465030"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 06:55:52 -0800
Date: Tue, 9 Feb 2021 06:55:51 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Subject: Re: ipmi lan interface question
Message-ID: <20210209145446.GA20035@mauery.jf.intel.com>
References: <PS2PR02MB35415290A2191B61F232947990B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <PS2PR02MB35415290A2191B61F232947990B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 01-Feb-2021 11:29 PM, Mohammed.Habeeb ISV wrote:
>Hi
>
>I am trying to test the ipmi lan interface for the first time. However, I see setting Authtype is failing. Please review the below logs and let me know if any inputs.
>OpenBMC Version is 2.9 .
>
>Setup:
>Openbmc machince 2.7(seahawk) ------openbmc machine 2.9(transformers)
>
>
>Below is the command outputs.
>
>/* 10.41.8.50 is transformers 2.9 BMC IP.*/
>seahawk:/# ipmitool -H 10.41.8.50 -U test -P test123 lan print -vvv

The default interface type (-I parameter) is lan, or in IPMI language, 
RMCP 1/1.5 connection. OpenBMC does not support this type of connection 
because it is terribly insecure. Make sure you choose RMCP+ (-I lanplus) 
as your interface type and cipher suite 17 (-C 17).

On newer versions of ipmitool, it will automatically negotiate the best 
cipher suite, but on older versions, it is best to choose 17.

--Vernon

>Sending IPMI/RMCP presence ping packet
>send_packet (12 bytes)
>06 00 ff 06 00 00 11 be 80 00 00 00
>ipmi_lan_send_cmd:opened=[1], open=[474656]
>>> IPMI Request Session Header (level 0)
>>>   Authtype   : NONE
>>>   Sequence   : 0x00000000
>>>   Session ID : 0x00000000
>>> IPMI Request Message Header
>>>   Rs Addr    : 20
>>>   NetFn      : 06
>>>   Rs LUN     : 0
>>>   Rq Addr    : 81
>>>   Rq Seq     : 01
>>>   Rq Lun     : 0
>>>   Command    : 38
>send_packet (23 bytes)
>06 00 ff 07 00 00 00 00 00 00 00 00 00 09 20 18
>c8 81 04 38 0e 04 31
>recv_packet (31 bytes)
>06 00 ff 07 00 00 00 00 00 00 00 00 00 10 81 1c
>63 20 04 38 00 01 80 04 02 00 00 00 00 1d 00
>ipmi message header (31 bytes)
>06 00 ff 07 00 00 00 00 00 00 00 00 00 10 81 1c
>63 20 04 38 00 01 80 04 02 00 00 00 00 1d 00
><< IPMI Response Session Header
><<   Authtype   : NONE
><<   Sequence   : 0x00000000
><<   Session ID : 0x00000000
><< IPMI Response Message Header
><<   Rq Addr    : 81
><<   NetFn      : 07
><<   Rq LUN     : 0
><<   Rs Addr    : 20
><<   Rq Seq     : 01
><<   Rs Lun     : 0+
><<   Command    : 38
><<   Compl Code : 0x00
>get_auth_capabilities (9 bytes)
>01 80 04 02 00 00 00 00 1d
>Channel 01 Authentication Capabilities:
>  Privilege Level : ADMINISTRATOR
>  Auth Types      :
>  Per-msg auth    : enabled
>  User level auth : enabled
>  Non-null users  : enabled
>  Null users      : disabled
>  Anonymous login : disabled
>
>Authentication type NONE not supported
>Error: Unable to establish LAN session
>Error: Unable to establish IPMI v1.5 / RMCP session
>seahawk:/#
>
>Since , AuthType NONE is not supported tried to set the auth type to MD5 but it fails.
>sysadmin@transformers:~# ipmitool lan set 1 auth Admin MD5,PASSWORD -vvv
>Loading IANA PEN Registry...
>Running Get PICMG Properties my_addr 0x20, transit 0, target 0
>Error response 0xc1 from Get PICMG Properties
>Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
>Invalid completion code received: Invalid command
>Acquire IPMB address
>Discovered IPMB address 0x0
>Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0
>
>Channel type: 802.3 LAN
>Auth Type Enable        : callback=0x00 user=0x00 operator=0x00 admin=0x00 oem=0x00
>authtype data (5 bytes)
>00 00 00 14 00
>Warning: Set LAN Parameter failed: Unknown (0x82)
>sysadmin@transformers:~#
>
>sysadmin@transformers:~# ipmitool channel getaccess 1 4
>Maximum User IDs     : 15
>Enabled User IDs     : 4
>
>User ID              : 4
>User Name            : test
>Fixed Name           : No
>Access Available     : callback
>Link Authentication  : enabled
>IPMI Messaging       : enabled
>Privilege Level      : ADMINISTRATOR
>Enable Status        : enabled
>sysadmin@transformers:~#
