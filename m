Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC2918C817
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 08:21:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kFZM6K6NzDrcH
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 18:21:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kFYb2DzVzDrbx
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 18:20:49 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K73jWY121304
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 03:20:47 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu863yvbv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 03:20:46 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 20 Mar 2020 07:20:44 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 07:20:43 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02K7KgD441091334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 07:20:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 146AEAE04D;
 Fri, 20 Mar 2020 07:20:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03628AE051;
 Fri, 20 Mar 2020 07:20:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.46.192])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 07:20:40 +0000 (GMT)
Subject: Re: Proposal for the connected redfish client info
To: James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org,
 i.mikhaylov@yadro.com, rhanley@google.com
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
 <76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 20 Mar 2020 12:50:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------43098C6C8BAF664537822711"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20032007-4275-0000-0000-000003AF8EDD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032007-4276-0000-0000-000038C4BF55
Message-Id: <477c9a0c-ea2a-f1d5-7e0f-59ece898096d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003200028
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
--------------43098C6C8BAF664537822711
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi James,Ivan,Richard

The Intention of the below requirement is to help the clients to find 
the other connected clients in realtime.

Richard, As you mentioned in other thread

*"Or is this being to log accesses for security audits?  I think that 
would help me figure out what direction we should move towards."*

  It may get used for security audits but didn't think before you 
pointed out.


On 3/17/20 9:28 PM, James Feist wrote:
> On 3/17/2020 6:01 AM, Ratan Gupta wrote:
>> Hi Team,
>>
>> Looking for your inputs
>>
>> James, How about option1 for the below use case
>
> Before creating OEM we are to propose it to the Redfish community. 
> Have you asked them for their thoughts?
My plan was to ask from the openBMC community first about the 
requirement, If the community interested in this we can propose it to 
the Redfish-Forum.
>
>>
>> Ratan
>>
>> On 3/11/20 3:48 PM, Ratan Gupta wrote:
>>>
>>> Hi Team,
>>>
>>> In IBM we have a following requirement
>>>
>>>   * Show the connected redfish client info.
>>>       o   ClientIP >>       o   Client Unique Identifier(unique 
>>> serial number of the 
> client etc)
>
> This confuses me, how are you getting the serial number for a 
> connected client? If so, have you looked into data protection laws and 
> storing Personally Identifiable Information?

Client have to give this info, it could be anything like hostname of the 
client, serial number of the machine etc, it is up to the client what 
they want to provide as part of client identifier.

Why it is needed?

Consider the below use case

=> Client(x.x.x.x) creates the session with BMC

=> BMC stores this IP(x.x.x.x)

=> Now say Client IP(x.x.x.x) got change to y.y.y.y but the session is 
still valid.

=> Stored IP(x.x.x.x) will not be much usable here in this scenario

=> Here Client Identifier may be usable to identify the connected client.

Let me know your thoughts here.


>
>>>
>>>
>>> Presently there is no way through which we can get this info.
>>>
>>> I have following two proposal for the above requirement.
>>>
>>> 1/ (Extend the session schema)
>>>
>>> Add the IPaddress and the client Identifier as a OEM in the session 
>>> schema,
>>> Clinet IP would be read only and will be updated once the redfish 
>>> client creates the session.
>>> ClientIdentifier(Management console unique serial number etc) will 
>>> be writable property and can be set by the redfish client
>>> during creation of the session or after creating the session.
>>>
>>>
>>> 2/ (Create the Manager object at runtime)
>>> once the redfish client creates the session , bmcweb internally does 
>>> the following
>>>
>>> - Create the manager object whose type is "Management Controller".
>>>
>>> - Create the ethernet interface resource manager resource and update 
>>> the client IP.
>>>
>>>    In the second option how to set the Client unique identifier 
>>> which is to be given by the Redfish client
>
> I've had talks before about creating a new systems schema for the BMC 
> specifically, so that you could expose things like bmc memory, etc. 
> Systems also has the Ethernet schema. However this depends on what 
> you're trying to present.
>
Here I was proposing to create a manager object for the external 
clients, once they creates the session with the BMC. I am not sure what 
else we can set for the connected client in the manager object so I was 
inclined towards extending the session schema instead of creating the 
manager object for external clients.
>>>
>>>  Please let me know your thoughts on the above.
>>>
>>> Ratan
>>>
Ratan

--------------43098C6C8BAF664537822711
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><tt>Hi James,Ivan,Richard</tt><tt><br>
      </tt></p>
    <p><tt>The Intention of the below requirement is to help the clients
        to find the other connected clients in realtime.</tt></p>
    <p><tt>Richard, As you mentioned in other thread </tt><tt><br>
      </tt></p>
    <p><b><tt>"Or is this being to log accesses for security audits?  I
          think that would help me figure out what direction we should
          move towards."</tt></b></p>
    <p><tt> It may get used for security audits but didn't think before
        you pointed out.</tt></p>
    <p><tt><br>
      </tt></p>
    <div class="moz-cite-prefix">On 3/17/20 9:28 PM, James Feist wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com">On
      3/17/2020 6:01 AM, Ratan Gupta wrote:
      <br>
      <blockquote type="cite">Hi Team,
        <br>
        <br>
        Looking for your inputs
        <br>
        <br>
        James, How about option1 for the below use case
        <br>
      </blockquote>
      <br>
      Before creating OEM we are to propose it to the Redfish community.
      Have you asked them for their thoughts?
      <br>
    </blockquote>
    <tt>My plan was to ask from the openBMC community first about the
      requirement, If the co</tt><tt>mmunity interested in this we can
      propose it to the Redfish-Forum.</tt><br>
    <blockquote type="cite"
      cite="mid:76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com">
      <br>
      <blockquote type="cite">
        <br>
        Ratan
        <br>
        <br>
        On 3/11/20 3:48 PM, Ratan Gupta wrote:
        <br>
        <blockquote type="cite">
          <br>
          Hi Team,
          <br>
          <br>
          In IBM we have a following requirement
          <br>
          <br>
            * Show the connected redfish client info.
          <br>
                o   ClientIP &gt;&gt;       o   Client Unique
          Identifier(unique serial number of the </blockquote>
      </blockquote>
      client etc)
      <br>
      <br>
      This confuses me, how are you getting the serial number for a
      connected client? If so, have you looked into data protection laws
      and storing Personally Identifiable Information?
      <br>
    </blockquote>
    <p><tt>Client have to give this info, it could be anything like
        hostname of the client, serial number of the machine etc, it is
        up to the client what they want to provide as part of client
        identifier.</tt></p>
    <p><tt>Why it is needed?</tt></p>
    <p><tt>Consider the below use case</tt></p>
    <tt>
    </tt>
    <p><tt>=&gt; Client(x.x.x.x) creates the session with BMC</tt></p>
    <tt>
    </tt>
    <p><tt>=&gt; BMC stores this IP(x.x.x.x)</tt></p>
    <tt>
    </tt>
    <p><tt>=&gt; Now say Client IP(x.x.x.x) got change to y.y.y.y but
        the session is still valid.</tt></p>
    <tt>
    </tt>
    <p><tt>=&gt; Stored IP(x.x.x.x) will not be much usable here in this
        scenario</tt></p>
    <tt>
    </tt>
    <p><tt>=&gt; Here Client Identifier may be usable to identify the
        connected client.</tt></p>
    <p><tt>Let me know your thoughts here.<br>
      </tt></p>
    <p><tt><br>
      </tt></p>
    <blockquote type="cite"
      cite="mid:76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com">
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          <br>
          Presently there is no way through which we can get this info.
          <br>
          <br>
          I have following two proposal for the above requirement.
          <br>
          <br>
          1/ (Extend the session schema)
          <br>
          <br>
          Add the IPaddress and the client Identifier as a OEM in the
          session schema,
          <br>
          Clinet IP would be read only and will be updated once the
          redfish client creates the session.
          <br>
          ClientIdentifier(Management console unique serial number etc)
          will be writable property and can be set by the redfish client
          <br>
          during creation of the session or after creating the session.
          <br>
          <br>
          <br>
          2/ (Create the Manager object at runtime)
          <br>
          once the redfish client creates the session , bmcweb
          internally does the following
          <br>
          <br>
          - Create the manager object whose type is "Management
          Controller".
          <br>
          <br>
          - Create the ethernet interface resource manager resource and
          update the client IP.
          <br>
          <br>
             In the second option how to set the Client unique
          identifier which is to be given by the Redfish client
          <br>
        </blockquote>
      </blockquote>
      <br>
      I've had talks before about creating a new systems schema for the
      BMC specifically, so that you could expose things like bmc memory,
      etc. Systems also has the Ethernet schema. However this depends on
      what you're trying to present.
      <br>
      <br>
    </blockquote>
    Here I was proposing to create a manager object for the external
    clients, once they creates the session with the BMC. I am not sure
    what else we can set for the connected client in the manager object
    so I was inclined towards extending the session schema instead of
    creating the manager object for external clients. <br>
    <blockquote type="cite"
      cite="mid:76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
           Please let me know your thoughts on the above.
          <br>
          <br>
          Ratan
          <br>
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
    Ratan<br>
  </body>
</html>

--------------43098C6C8BAF664537822711--

