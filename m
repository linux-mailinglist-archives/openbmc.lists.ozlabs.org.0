Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85614D14D
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 20:43:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487DRY06QHzDqSk
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 06:43:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487DQp0GvPzDqSh
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 06:42:24 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TJcguY132408; Wed, 29 Jan 2020 14:42:19 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrj741uqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 14:42:19 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00TJfMAU004328;
 Wed, 29 Jan 2020 19:42:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2xrda6mn0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 19:42:16 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TJgFhA55640356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 19:42:15 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67945136055;
 Wed, 29 Jan 2020 19:42:15 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8C5713604F;
 Wed, 29 Jan 2020 19:42:14 +0000 (GMT)
Received: from [9.10.100.197] (unknown [9.10.100.197])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 19:42:14 +0000 (GMT)
Subject: Re: Redfish OpenBMC OEM
To: James Feist <james.feist@linux.intel.com>,
 przemyslaw.hawrylewicz.czarnowski@intel.com, pawel.rapkiewicz@intel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
 <dcfd49c5-48a1-12aa-2f1e-56aef6232cfc@linux.ibm.com>
 <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
 <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
 <b2654349-f0bf-b341-5736-618dfa2c1fa9@linux.intel.com>
 <bd1c5c4f-68f7-42d4-aebd-daa6629deef5@linux.vnet.ibm.com>
 <e4ce21b1-cab9-765d-100b-5c62843468e0@linux.intel.com>
 <f5078dd7-1b7b-1b93-d1e6-b56081b55835@linux.vnet.ibm.com>
 <e869ddc9-4682-78b1-b289-6f5ad4a525dc@linux.intel.com>
 <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
 <2b781d56-e375-96a9-c83d-87e07f0d00dd@linux.vnet.ibm.com>
 <bdedea87-1400-7aa3-e1dc-a1c915b2cdb0@linux.intel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <ca2289f5-63b4-8119-a18d-8734d803cec0@linux.vnet.ibm.com>
Date: Wed, 29 Jan 2020 13:42:14 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bdedea87-1400-7aa3-e1dc-a1c915b2cdb0@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------862C8484692B0BD24B364B67"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_06:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=692 impostorscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290153
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------862C8484692B0BD24B364B67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/29/2020 11:20 AM, James Feist wrote:
>
> Yes, from the comments:
>
> "Was this brought up to DMTF? 
> https://github.com/openbmc/bmcweb/commit/40d68ef6ebe088e4cd0078f8ff4910ca58f2be5d
>
> I've created new thread on Redfish forum:
> https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal" 
>

I am confused by the reply (3rd comment) on 
https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal
Aren't you asking Redfish for a way to support Virtual Media via 
WebSockets? What is called "Proxy Mode" in 
https://github.com/openbmc/docs/blob/master/designs/VirtualMedia.md. 
This would be the communication between bmcweb and the browser. 
"WebSocket is a computer communications protocol, providing full-duplex 
communication channels over a single TCP connection."

Isn't the "VirtualMedia" in the Redfish ManagerNetworkProtocol schema a 
start?


--------------862C8484692B0BD24B364B67
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/29/2020 11:20 AM, James Feist
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bdedea87-1400-7aa3-e1dc-a1c915b2cdb0@linux.intel.com">
      <br>
      Yes, from the comments:
      <br>
      <br>
      "Was this brought up to DMTF?
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/bmcweb/commit/40d68ef6ebe088e4cd0078f8ff4910ca58f2be5d">https://github.com/openbmc/bmcweb/commit/40d68ef6ebe088e4cd0078f8ff4910ca58f2be5d</a><br>
      <br>
      I've created new thread on Redfish forum:
      <br>
<a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal">https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal</a>"
      <br>
    </blockquote>
    <p>I am confused by the reply (3rd comment) on
<a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal">https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal</a>
      <br>
      Aren't you asking Redfish for a way to support Virtual Media via
      WebSockets? What is called "Proxy Mode" in
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/designs/VirtualMedia.md">https://github.com/openbmc/docs/blob/master/designs/VirtualMedia.md</a>.
      This would be the communication between bmcweb and the browser.
      "WebSocket is a computer communications protocol, providing
      full-duplex communication channels over a single TCP connection."
      <br>
      <br>
      Isn't the <span class="treeLabel objectLabel"
        aria-labelledby="default" data-level="3">"VirtualMedia" in the
        Redfish </span><span class="treeLabel objectLabel"
        aria-labelledby="default" data-level="3">ManagerNetworkProtocol
        schema a start?<br>
      </span></p>
  </body>
</html>

--------------862C8484692B0BD24B364B67--

