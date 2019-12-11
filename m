Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E111AA55
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 12:56:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XwQD2ycWzDqnk
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 22:56:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XwNz2YTbzDqh2
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 22:55:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBBqG5s110363
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 06:55:44 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsrdq1myk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 06:55:44 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 11 Dec 2019 11:55:42 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Dec 2019 11:55:39 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBBtcup55181380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 11:55:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D166EA404D
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 11:55:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71E0FA4051
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 11:55:38 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 11:55:37 +0000 (GMT)
Subject: Fwd: Redfish Dump Service Proposal
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
X-Forwarded-Message-Id: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
Date: Wed, 11 Dec 2019 17:25:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------D6F23F2FD7B3AFE1345191FF"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19121111-4275-0000-0000-0000038DED09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121111-4276-0000-0000-000038A1A2B2
Message-Id: <1790482b-27ad-7042-83ef-f9819966b4a4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_02:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 mlxlogscore=611 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110103
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
--------------D6F23F2FD7B3AFE1345191FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Last email I sent on the proposal for Redfish Dump service did not get 
delivered due to the attachment size restriction.

I have upload the same onto DMTF. Please take a look into it and provide 
your comments here or on the dmtf forum.

Link: https://members.dmtf.org/apps/org/workgroup/redfish/download.php/91877

Ratan

-------- Forwarded Message --------
Subject: 	Redfish Dump Service Proposal
Date: 	Tue, 10 Dec 2019 16:51:12 +0530
From: 	Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: 	openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>



Hi All,

Please find the redfish dump service proposal for the DMTF attached.

Kindly review and provide your inputs.

Ratan





--------------D6F23F2FD7B3AFE1345191FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-forward-container">Hi All,</div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">Last email I sent on the proposal
      for Redfish Dump service did not get delivered due to the
      attachment size restriction. <br>
    </div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">I have upload the same onto DMTF.
      Please take a look into it and provide your comments here or on
      the dmtf forum.</div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">Link:
      <a class="moz-txt-link-freetext" href="https://members.dmtf.org/apps/org/workgroup/redfish/download.php/91877">https://members.dmtf.org/apps/org/workgroup/redfish/download.php/91877</a><br>
    </div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">Ratan</div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">-------- Forwarded Message
      --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
            </th>
            <td>Redfish Dump Service Proposal</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date: </th>
            <td>Tue, 10 Dec 2019 16:51:12 +0530</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From: </th>
            <td>Ratan Gupta <a class="moz-txt-link-rfc2396E" href="mailto:ratagupt@linux.vnet.ibm.com">&lt;ratagupt@linux.vnet.ibm.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
              <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      Hi All,<br>
      <br>
      Please find the redfish dump service proposal for the DMTF
      attached.<br>
      <br>
      Kindly review and provide your inputs.<br>
      <br>
      Ratan<br>
      <br>
      <br>
      <br>
      <br>
    </div>
  </body>
</html>

--------------D6F23F2FD7B3AFE1345191FF--

