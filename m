Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229D1884AD
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 14:02:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hYH33L1KzDqgf
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 00:02:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYFx3VH5zDqcV
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 00:01:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HCsQWv019784
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 09:01:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ytb4ucsut-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 09:01:19 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 17 Mar 2020 13:01:17 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 13:01:15 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HD1Eu430212174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 13:01:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CC0442078;
 Tue, 17 Mar 2020 13:01:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F9834206C;
 Tue, 17 Mar 2020 13:01:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.56.38])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 13:01:13 +0000 (GMT)
Subject: Re: Proposal for the connected redfish client info
To: openbmc@lists.ozlabs.org, james.feist@linux.intel.com
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Tue, 17 Mar 2020 18:31:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------2730DBA84CE479B0EAB77CC8"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20031713-0012-0000-0000-000003928CC6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031713-0013-0000-0000-000021CF6BA0
Message-Id: <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_04:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxlogscore=945
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003170054
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

This is a multi-part message in MIME format.
--------------2730DBA84CE479B0EAB77CC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Team,

Looking for your inputs

James, How about option1 for the below use case

Ratan

On 3/11/20 3:48 PM, Ratan Gupta wrote:
>
> Hi Team,
>
> In IBM we have a following requirement
>
>   * Show the connected redfish client info.
>       o   ClientIP
>       o   Client Unique Identifier(unique serial number of the client etc)
>
>
> Presently there is no way through which we can get this info.
>
> I have following two proposal for the above requirement.
>
> 1/ (Extend the session schema)
>
> Add the IPaddress and the client Identifier as a OEM in the session 
> schema,
> Clinet IP would be read only and will be updated once the redfish 
> client creates the session.
> ClientIdentifier(Management console unique serial number etc) will be 
> writable property and can be set by the redfish client
> during creation of the session or after creating the session.
>
>
> 2/ (Create the Manager object at runtime)
> once the redfish client creates the session , bmcweb internally does 
> the following
>
> - Create the manager object whose type is "Management Controller".
>
> - Create the ethernet interface resource manager resource and update 
> the client IP.
>
>    In the second option how to set the Client unique identifier which 
> is to be given by the Redfish client
>
>  Please let me know your thoughts on the above.
>
> Ratan
>

--------------2730DBA84CE479B0EAB77CC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Team,</p>
    <p>Looking for your inputs <br>
    </p>
    <p>James, How about option1 for the below use case<br>
    </p>
    <p>Ratan</p>
    <div class="moz-cite-prefix">On 3/11/20 3:48 PM, Ratan Gupta wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p>Hi Team,<br>
        <br>
        In IBM we have a following requirement<br>
      </p>
      <ul>
        <li>Show the connected redfish client info.</li>
        <ul>
          <li>  ClientIP</li>
          <li>  Client Unique Identifier(unique serial number of the
            client etc)<br>
          </li>
        </ul>
      </ul>
      <p><br>
        Presently there is no way through which we can get this info.<br>
        <br>
        I have following two proposal for the above requirement.<br>
        <br>
        1/ (Extend the session schema)<br>
        <br>
        Add the IPaddress and the client Identifier as a OEM in the
        session schema,<br>
        Clinet IP would be read only and will be updated once the
        redfish client creates the session.<br>
        ClientIdentifier(Management console unique serial number etc)
        will be writable property and can be set by the redfish client <br>
        during creation of the session or after creating the session.<br>
        <br>
        <br>
        2/ (Create the Manager object at runtime)<br>
        once the redfish client creates the session , bmcweb internally
        does the following</p>
      <p>- Create the manager object whose type is "Management
        Controller".</p>
      <p>- Create the ethernet interface resource manager resource and
        update the client IP.</p>
      <p>   In the second option how to set the Client unique identifier
        which is to be given by the Redfish client</p>
      <p> Please let me know your thoughts on the above.<br>
        <br>
        Ratan<br>
      </p>
    </blockquote>
  </body>
</html>

--------------2730DBA84CE479B0EAB77CC8--

