Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E81815A6
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 11:19:26 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cnxl3JJHzDqMf
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 21:19:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cnx43RVKzDqLP
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 21:18:46 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BAEdoZ032136
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 06:18:38 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypvxp48nq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 06:18:37 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 11 Mar 2020 10:18:36 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 10:18:34 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02BAIXxt58720332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 10:18:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4875AE051;
 Wed, 11 Mar 2020 10:18:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2A9CAE04D;
 Wed, 11 Mar 2020 10:18:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.10])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 10:18:32 +0000 (GMT)
To: openbmc@lists.ozlabs.org, james.feist@linux.intel.com
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Proposal for the connected redfish client info
Date: Wed, 11 Mar 2020 15:48:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------4DFE965D1497C40B6C394189"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20031110-0016-0000-0000-000002EF58BE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031110-0017-0000-0000-00003352C0F4
Message-Id: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_02:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=807 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110066
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
--------------4DFE965D1497C40B6C394189
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Team,

In IBM we have a following requirement

  * Show the connected redfish client info.
      o    ClientIP
      o    Client Unique Identifier(unique serial number of the client etc)


Presently there is no way through which we can get this info.

I have following two proposal for the above requirement.

1/ (Extend the session schema)

Add the IPaddress and the client Identifier as a OEM in the session schema,
Clinet IP would be read only and will be updated once the redfish client 
creates the session.
ClientIdentifier(Management console unique serial number etc) will be 
writable property and can be set by the redfish client
during creation of the session or after creating the session.


2/ (Create the Manager object at runtime)
once the redfish client creates the session , bmcweb internally does the 
following

- Create the manager object whose type is "Management Controller".

- Create the ethernet interface resource manager resource and update the 
client IP.

    In the second option how to set the Client unique identifier which 
is to be given by the Redfish client

  Please let me know your thoughts on the above.

Ratan


--------------4DFE965D1497C40B6C394189
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
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
      Clinet IP would be read only and will be updated once the redfish
      client creates the session.<br>
      ClientIdentifier(Management console unique serial number etc) will
      be writable property and can be set by the redfish client <br>
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
  </body>
</html>

--------------4DFE965D1497C40B6C394189--

