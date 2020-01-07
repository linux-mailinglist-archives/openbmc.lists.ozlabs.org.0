Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EAD131CD3
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 01:42:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sD9X36R0zDqFF
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 11:42:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sD6Z45M2zDqRd
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 11:39:49 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0070bNI8029124; Mon, 6 Jan 2020 19:39:46 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb92mkum4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 19:39:46 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0070VFEt008287;
 Tue, 7 Jan 2020 00:39:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2xajb66p70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 00:39:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0070diWr41877844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 00:39:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51031C6055;
 Tue,  7 Jan 2020 00:39:44 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E69DC605A;
 Tue,  7 Jan 2020 00:39:42 +0000 (GMT)
Received: from [9.102.41.189] (unknown [9.102.41.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 00:39:41 +0000 (GMT)
Subject: Re: webui not working for me
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com>
 <a009631a-efec-2e14-6871-b8618ffb4b96@linux.vnet.ibm.com>
 <E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com>
 <1bec6eda-be49-e9b7-2ba3-f1ec5d4d89e8@linux.vnet.ibm.com>
 <FF4567F9-FA73-4076-AD9E-67C0237F4521@fb.com>
 <e100a34f-0335-d557-7e83-ebae9338b02f@linux.vnet.ibm.com>
 <D4297867-C2F9-448D-887E-032C1EF5B871@fb.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <99c35ab3-0152-afcc-72c1-e359b3569e9a@linux.vnet.ibm.com>
Date: Mon, 6 Jan 2020 18:39:39 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <D4297867-C2F9-448D-887E-032C1EF5B871@fb.com>
Content-Type: multipart/alternative;
 boundary="------------84248E378CD3239B222150FA"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070002
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
--------------84248E378CD3239B222150FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/2020 6:29 PM, Vijay Khemka wrote:
>
> It says on page “there are no sensors available”
>
>
A curl call to /xyz/openbmc_project/sensors/enumerate returns all the 
sensors correctly ?

If so, probably will need to add some console.log()s to that function
https://github.com/openbmc/phosphor-webui/blob/f70f42553615972163b36c9b4d77be07e4399122/app/common/services/api-utils.js#L912



--------------84248E378CD3239B222150FA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/6/2020 6:29 PM, Vijay Khemka
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:D4297867-C2F9-448D-887E-032C1EF5B871@fb.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.5pt;
	font-family:Menlo;
	color:black;}
p.p2, li.p2, div.p2
	{mso-style-name:p2;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.5pt;
	font-family:Menlo;
	color:black;}
span.EmailStyle22
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.s1
	{mso-style-name:s1;
	color:#B2B2B2;
	background:black;}
span.s3
	{mso-style-name:s3;
	background:#878A04;}
span.s4
	{mso-style-name:s4;
	color:#EBEF18;}
span.s2
	{mso-style-name:s2;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
span.EmailStyle28
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle29
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.pl-s
	{mso-style-name:pl-s;}
span.pl-pds
	{mso-style-name:pl-pds;}
span.EmailStyle32
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
      <div class="WordSection1"><span style="font-size:11.0pt"><o:p></o:p></span>
        <div>
          <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt">It says on
              page “there are no sensors available”<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt"><br>
            </span></p>
        </div>
      </div>
    </blockquote>
    <p><span style="font-size:11.0pt"><span class="pl-s">A curl call to
          /xyz/openbmc_project/sensors/enumerate returns all the sensors
          correctly ? <br>
          <br>
          If so, probably will need to add some console.log()s to that
          function<br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-webui/blob/f70f42553615972163b36c9b4d77be07e4399122/app/common/services/api-utils.js#L912">https://github.com/openbmc/phosphor-webui/blob/f70f42553615972163b36c9b4d77be07e4399122/app/common/services/api-utils.js#L912</a><br>
          <br>
          <br>
        </span></span></p>
    <p><span style="font-size:11.0pt"><span class="pl-s"></span></span></p>
  </body>
</html>

--------------84248E378CD3239B222150FA--

