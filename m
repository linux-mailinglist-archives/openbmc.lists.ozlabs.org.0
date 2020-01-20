Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B4214241A
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 08:14:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481NG61KWQzDqRk
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 18:14:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 481NFV50fSzDqXv
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 18:14:06 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00K7CJSw076597
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 02:14:03 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmg7xnpy6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 02:14:03 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 20 Jan 2020 07:14:02 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Jan 2020 07:14:00 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00K7DxG157737302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 07:13:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C54BBA4051
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 07:13:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6948BA404D
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 07:13:59 +0000 (GMT)
Received: from [9.202.12.60] (unknown [9.202.12.60])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 07:13:59 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Add OEM Interface in bmcweb
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Mon, 20 Jan 2020 12:43:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------6A18160E2558F706E52FEBBD"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20012007-0008-0000-0000-0000034AF605
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012007-0009-0000-0000-00004A6B57B1
Message-Id: <98c85219-dc21-8012-09c9-6285c7a7a235@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-19_08:2020-01-16,
 2020-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=333 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001200063
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
--------------6A18160E2558F706E52FEBBD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

The purpose of this mail is to define the process/steps for adding the 
OEM interfaces.

Our first step would be to get the buying from the openbmc community for 
OEM interfaces/OEM properties.

If as a community we are on the same page then we can push these 
enhancements to DMTF.

eg: Redfish Dump service proposal review which is going on in the 
openBMC community.

If the enhancements are specific to OEM then we can add the OEM 
interfaces as following.

1) Introduce a compile time flag in the bmcweb

2) Put all the OEM specific interface functionalities in the new files.

3) Include the new files under the compile time flag as majority of the 
code in bmcweb written in header file.

If the OEM interfaces is redfish like interface then we need to do the 
following steps

     a) Implement the oem service root(eg: ibm/v1)

     b) Create the schema files

     c) Implement the metadata(ibm/v1/$metadata)

     d) Make the changes in the bb file so it installs the OEM schema 
files at the correct location.

     e) Storing the OEM schema files shall be some enterprise specific path.

Reference code is at the below location.(metadata implementation is WIP)
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27982 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27982/2>

Ratan







--------------6A18160E2558F706E52FEBBD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font size="+1"><tt>Hi All,</tt></font></p>
    <font size="+1"><tt>The purpose of this mail is to define the
        process/steps for adding the OEM interfaces.</tt><tt><br>
      </tt></font>
    <p><tt><font size="+1">Our first step would be to get the buying
          from the openbmc community for OEM interfaces/OEM properties</font>.</tt><font
        size="+1"><tt><br>
        </tt></font></p>
    <p><font size="+1"><tt>If as a community we are on the same page
          then we can push these enhancements to DMTF.</tt></font><br>
    </p>
    <p><font size="+1"><tt>eg: Redfish Dump service proposal review
          which is going on in the openBMC community.</tt></font></p>
    <p><font size="+1"><tt>If the enhancements are specific to OEM then
          we can add the OEM interfaces as following.</tt></font></p>
    <p><font size="+1"><tt>1) Introduce a compile time flag in the
          bmcweb</tt></font></p>
    <p><font size="+1"><tt>2) Put all the OEM specific interface
          functionalities in the new files.</tt></font></p>
    <p><font size="+1"><tt>3) Include the new files under the compile
          time flag as majority of the code in bmcweb written in header
          file.</tt></font></p>
    <p><font size="+1"><tt>If the OEM interfaces is redfish like
          interface then we need to do the following steps</tt></font></p>
    <font size="+1"><tt>    a) Implement the oem service root(eg:
        ibm/v1) </tt><tt><br>
      </tt></font>
    <p><font size="+1"><tt>    b) Create the schema files</tt></font></p>
    <p><font size="+1"><tt>    c) Implement the
          metadata(ibm/v1/$metadata)</tt></font></p>
    <p><font size="+1"><tt>    d) Make the changes in the bb file so it
          installs the OEM schema files at the correct location.</tt></font></p>
    <p><font size="+1"><tt>    e) Storing the OEM schema files shall be
          some enterprise specific path.</tt></font></p>
    <p><font size="+1"><tt> </tt></font></p>
    <font size="+1"><tt>Reference code is at the below
        location.(metadata implementation is WIP)</tt><tt><br>
      </tt><tt><a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27982/2">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27982</a></tt></font><br>
    <br>
    <font size="+1"><tt>Ratan</tt></font><br>
    <p>    <br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------6A18160E2558F706E52FEBBD--

