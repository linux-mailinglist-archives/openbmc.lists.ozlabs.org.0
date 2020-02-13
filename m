Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22D15BAD9
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:36:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J8xN4tShzDqVB
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 19:36:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J8wb2FbrzDqTC
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 19:35:42 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D8ScuK109099
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 03:35:40 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y3u5291sb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 03:35:39 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 13 Feb 2020 08:35:37 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Feb 2020 08:35:36 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01D8ZadM49414258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Feb 2020 08:35:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F151D5204E;
 Thu, 13 Feb 2020 08:35:35 +0000 (GMT)
Received: from [9.202.12.60] (unknown [9.202.12.60])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3BBD852050;
 Thu, 13 Feb 2020 08:35:35 +0000 (GMT)
Subject: Re: Add OEM Interface in bmcweb
To: Patrick Williams <patrick@stwcx.xyz>
References: <98c85219-dc21-8012-09c9-6285c7a7a235@linux.vnet.ibm.com>
 <20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 13 Feb 2020 14:04:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: multipart/alternative;
 boundary="------------F6B06F1E04AB8A89966F6FD8"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20021308-0016-0000-0000-000002E662BD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021308-0017-0000-0000-000033496338
Message-Id: <392a6aa8-384d-6973-fa6e-0ad383497296@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=414 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130067
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

This is a multi-part message in MIME format.
--------------F6B06F1E04AB8A89966F6FD8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 22/01/20 3:28 AM, Patrick Williams wrote:
> On Mon, Jan 20, 2020 at 12:43:57PM +0530, Ratan Gupta wrote:
>> 1) Introduce a compile time flag in the bmcweb
>> 2) Put all the OEM specific interface functionalities in the new files.
>>
>> 3) Include the new files under the compile time flag as majority of the code
>> in bmcweb written in header file.
>>
> Do we want OEM commands to be in bmcweb also?
Yes Redfish has a support for the same, However we want to minimize the 
need as much as possible by
1) Put across your need in the community and find out if this is a 
common requirement
2) If it is a common requirement across the openBMC community then 
propose it in the DMTF.
>   Or more of a plugin
> nature like the IPMI implementation?
We tried the same earlier in the community call and discussed that we 
should avoid it for the following reason.

  * People will start using the Oem here and there and the community
    will never know the requirement which can be standardized.


> It seems to me that there will be OEM commands that are not open source
> either due to NDAs on certain hardware or secret sauce in data center
> management software that various cloud vendors have.
Yes certain OEM cmds would be there which can not be standardized.
Ratan

--------------F6B06F1E04AB8A89966F6FD8
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22/01/20 3:28 AM, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Jan 20, 2020 at 12:43:57PM +0530, Ratan Gupta wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">1) Introduce a compile time flag in the bmcweb
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">2) Put all the OEM specific interface functionalities in the new files.

3) Include the new files under the compile time flag as majority of the code
in bmcweb written in header file.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do we want OEM commands to be in bmcweb also? </pre>
    </blockquote>
    <tt>Yes Redfish has a support for the same, However we want to
      minimize the need as much as possible by</tt><tt><br>
    </tt><tt>1) Put across your need in the community and find out if
      this is a common requirement</tt><tt><br>
    </tt><tt>2) If it is a common requirement across the openBMC
      community then propose it in the DMTF.</tt><br>
    <blockquote type="cite"
      cite="mid:20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com">
      <pre class="moz-quote-pre" wrap=""> Or more of a plugin
nature like the IPMI implementation?</pre>
    </blockquote>
    <tt>We tried the same earlier in the community call and discussed
      that we should avoid it for the following reason</tt><tt>.<br>
    </tt>
    <ul>
      <li><tt>People will start using the Oem here and there and the
          community will never know the requirement which can be
          standardized.</tt><br>
      </li>
    </ul>
    <br>
    <blockquote type="cite"
      cite="mid:20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com">
      <pre class="moz-quote-pre" wrap="">
It seems to me that there will be OEM commands that are not open source
either due to NDAs on certain hardware or secret sauce in data center
management software that various cloud vendors have.
</pre>
    </blockquote>
    <tt>Yes certain OEM cmds would be there which can not be
      standardized.</tt><br>
    <blockquote type="cite"
      cite="mid:20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    Ratan<br>
  </body>
</html>

--------------F6B06F1E04AB8A89966F6FD8--

