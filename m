Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E70CD130D3B
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 06:42:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkst1j9bzDqFH
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:42:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkpQ027ZzDqC5
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 16:39:08 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0065bcu2014040; Mon, 6 Jan 2020 00:39:04 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb8uk6nm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 00:39:04 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0065Vs92018705;
 Mon, 6 Jan 2020 05:39:03 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2xajb6bfvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 05:39:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0065d20429557140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 05:39:03 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DABF8124053;
 Mon,  6 Jan 2020 05:39:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB940124052;
 Mon,  6 Jan 2020 05:39:00 +0000 (GMT)
Received: from [9.102.51.133] (unknown [9.102.51.133])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 05:38:59 +0000 (GMT)
Subject: Re: webui not working for me
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <a009631a-efec-2e14-6871-b8618ffb4b96@linux.vnet.ibm.com>
Date: Sun, 5 Jan 2020 23:38:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com>
Content-Type: multipart/alternative;
 boundary="------------D367CD38C9ED5D70563BCA20"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_01:2020-01-06,2020-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001060052
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
--------------D367CD38C9ED5D70563BCA20
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/3/2020 7:38 PM, Vijay Khemka wrote:
>
>
> I am trying to use webui but not getting anything working. I might be 
> missing some steps.
>
> I did following.
>
>  1. npm install in repo directory.
>  2. Recompiled bmcweb with BMCWEB_INSECURE_DISABLE_XSS_PREVENTION on
>     and transferred bmcweb to target.
>  3. Run chrome browser with http://bmc-ip
>  4. I see blank page. Then tried with https and accepted certificates.
>  5. But still I see page with “refused to connect”
>
Hi Vijay,

Are you trying to run the webui locally (e.g. npm run-script server and 
then browse to http://localhost:8080 )?

If so, something more like:
npm install
npm run-script server
Recompile bmcweb with BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and 
BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION and transfer bmcweb to target.
Go to https://bmc-ip and accept the certificate
Go to http://localhost:8080 (could be running at a different port, check 
npm run-script server output) and point at bmc-ip

If you are trying to build the webui for the BMC (npm run-script build) 
and scp the files over, do you need to include the webui package group?

https://github.com/openbmc/openbmc/commit/fef8abbc78154abbd86ab9f0704e65ccb422f4de

The webui recipe creates the webui directory structure on the BMC.


> Please help me what else I need to do. I got 2 warning while 
> installing NPM.
>
The warnings should not matter.

- Gunnar

--------------D367CD38C9ED5D70563BCA20
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/3/2020 7:38 PM, Vijay Khemka
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com">
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:784426178;
	mso-list-type:hybrid;
	mso-list-template-ids:-1543190074 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><br>
        </p>
        <p class="MsoNormal"><span style="font-size:11.0pt">I am trying
            to use webui but not getting anything working. I might be
            missing some steps.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">I did
            following.<o:p></o:p></span></p>
        <ol style="margin-top:0in" type="1" start="1">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:11.0pt">npm install in repo directory.<o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:11.0pt">Recompiled bmcweb with
            </span><span
              style="font-size:10.0pt;font-family:Consolas;color:#24292E">BMCWEB_INSECURE_DISABLE_XSS_PREVENTION
              on and transferred bmcweb to target.</span><span
              style="font-size:11.0pt"><o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:10.0pt;font-family:Consolas;color:#24292E">Run
              chrome browser with
              <a href="http://bmc-ip" moz-do-not-send="true">http://bmc-ip</a></span><span
              style="font-size:11.0pt"><o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:10.0pt;font-family:Consolas;color:#24292E">I
              see blank page. Then tried with https and accepted
              certificates.</span><span style="font-size:11.0pt"><o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:10.0pt;font-family:Consolas;color:#24292E">But
              still I see page with “refused to connect”</span><span
              style="font-size:11.0pt"><o:p></o:p></span></li>
        </ol>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <p>Hi Vijay,<br>
      <br>
      Are you trying to run the webui locally (e.g. npm run-script
      server and then browse to <a class="moz-txt-link-freetext" href="http://localhost:8080">http://localhost:8080</a> )?<br>
      <br>
      If so, something more like:<br>
      npm install <br>
      npm run-script server<br>
      Recompile bmcweb with BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and
      BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION and transfer bmcweb to
      target.<br>
      Go to <a class="moz-txt-link-freetext" href="https://bmc-ip">https://bmc-ip</a> and accept the certificate <br>
      Go to <a class="moz-txt-link-freetext" href="http://localhost:8080">http://localhost:8080</a> (could be running at a different port,
      check npm run-script server output) and point at bmc-ip <br>
      <br>
      If you are trying to build the webui for the BMC (npm run-script
      build) and scp the files over, do you need to include the webui
      package group? <br>
      <br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/commit/fef8abbc78154abbd86ab9f0704e65ccb422f4de">https://github.com/openbmc/openbmc/commit/fef8abbc78154abbd86ab9f0704e65ccb422f4de</a><br>
      <br>
      The webui recipe creates the webui directory structure on the BMC.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt">Please help
            me what else I need to do. I got 2 warning while installing
            NPM.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    The warnings should not matter.<br>
    <br>
    - Gunnar<br>
  </body>
</html>

--------------D367CD38C9ED5D70563BCA20--

