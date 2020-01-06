Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D9131C95
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:57:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sC9z2DJrzDqJX
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 10:57:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sC5C4nrRzDqRf
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 10:53:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006Nq9V1140837; Mon, 6 Jan 2020 18:53:30 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8wxbpvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 18:53:30 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006NpU5b029872;
 Mon, 6 Jan 2020 23:53:29 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2xajb6bwg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 23:53:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006NrSeV62390606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 23:53:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCF41C6059;
 Mon,  6 Jan 2020 23:53:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41A19C6057;
 Mon,  6 Jan 2020 23:53:24 +0000 (GMT)
Received: from [9.102.41.189] (unknown [9.102.41.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 23:53:23 +0000 (GMT)
Subject: Re: webui not working for me
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com>
 <a009631a-efec-2e14-6871-b8618ffb4b96@linux.vnet.ibm.com>
 <E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <1bec6eda-be49-e9b7-2ba3-f1ec5d4d89e8@linux.vnet.ibm.com>
Date: Mon, 6 Jan 2020 17:53:22 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com>
Content-Type: multipart/alternative;
 boundary="------------DC417965B515E26CCD4C8CA4"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060193
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
--------------DC417965B515E26CCD4C8CA4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/2020 1:27 PM, Vijay Khemka wrote:
>
> Hi Gunnar,
>
> Now I am following below steps. I am running all these from my mac 
> laptop. Nothing on BMC, just copied bmcweb on BMC.
>
>  1. npm install in repo directory.
>  2. npm run-script server
>  3. Recompiled bmcweb with BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and
>     BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION and transfered bmcweb to
>     target.
>  4. Go to https://bmc-ip
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__bmc-2Dip&d=DwMDaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=kJtGvuus9oDRupym2EBb90B5bKvSi-pPMLdfIXHUGAM&s=gdm3UjRQnu_XRVgmp5SVt9W82Tl-uoCarovDoHDdD1Y&e=>,
>     no certificates asked, says certificate expired on Dec 29 1979.
>     Go to http://localhost:8080
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__localhost-3A8080&d=DwMDaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=kJtGvuus9oDRupym2EBb90B5bKvSi-pPMLdfIXHUGAM&s=r_P53gY50VmvMsyQPhxD35FdzONyzQNBH3GUYTerV4M&e=>,
>     Don’t see any port as output for “npm run-script server”.
>
Looks like it is :18898 for you. "Project is running at 
http://localhost:18898/"


> vijaykhemka-mbp:phosphor-webui vijaykhemka$ npm run-script server
>
> > phosphor-webui@2.8.0-dev server 
> /Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui
>
> > webpack-dev-server --history-api-fallback --inline --progress 
> --devtool source-map --mode development
>
> *10% building 1/1 modules 0 active*ℹ｢wds｣: Project is running at 
> http://localhost:18898/
>
> ℹ｢wds｣: webpack output is served from /
>
> ℹ｢wds｣: Content not from webpack is served from ./src/public
>
> ℹ｢wds｣: 404s will fallback to /index.html
>
> *10% building 1/3 modules 2 active 
> ...babel-loader/lib/index.js??ref--4!/Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/webpack-dev-server/client/index.js?http://localhost:18898*Browserslist: 
> caniuse-lite is outdated. Please run next command `npm update`
>
> *67% building 545/571 modules 26 active 
> /Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/core-js/modules/es.reflect.is-extensible.js*[BABEL] 
> Note: The code generator has deoptimised the styling of 
> /Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/angular/angular.js 
> as it exceeds the max of 500KB.
>
> *66% building 557/590 modules 33 active 
> /Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/core-js/modules/es.object.to-string.js*[BABEL] 
> Note: The code generator has deoptimised the styling of 
> /Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/text-encoding/lib/encoding-indexes.js 
> as it exceeds the max of 500KB.
>
> ℹ｢wdm｣: 761 modules
>
> ℹ｢wdm｣: Compiled successfully.
>
> Regards
>
> -Vijay
>

--------------DC417965B515E26CCD4C8CA4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/6/2020 1:27 PM, Vijay Khemka
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Apple Color Emoji";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}
@font-face
	{font-family:"\@MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
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
/* List Definitions */
@list l0
	{mso-list-id:761224288;
	mso-list-template-ids:1261490162;}
@list l1
	{mso-list-id:784426178;
	mso-list-type:hybrid;
	mso-list-template-ids:-1543190074 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:816609008;
	mso-list-type:hybrid;
	mso-list-template-ids:-1543190074 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level9
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
        <p class="MsoNormal"><span style="font-size:11.0pt">Hi Gunnar,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">Now I am
            following below steps. I am running all these from my mac
            laptop. Nothing on BMC, just copied bmcweb on BMC.<o:p></o:p></span></p>
        <ol style="margin-top:0in" type="1" start="1">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo3"><span
              style="font-size:11.0pt">npm install in repo directory.</span><o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo3">npm
            run-script server<o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo3">Recompiled
            bmcweb with BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and
            BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION and transfered
            bmcweb to target.<o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo3">Go to
            <a
href="https://urldefense.proofpoint.com/v2/url?u=https-3A__bmc-2Dip&amp;d=DwMDaQ&amp;c=5VD0RTtNlTh3ycd41b3MUw&amp;r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=kJtGvuus9oDRupym2EBb90B5bKvSi-pPMLdfIXHUGAM&amp;s=gdm3UjRQnu_XRVgmp5SVt9W82Tl-uoCarovDoHDdD1Y&amp;e="
              moz-do-not-send="true">
              https://bmc-ip</a>, no certificates asked, says
            certificate expired on Dec 29 1979.<br>
            Go to <a
href="https://urldefense.proofpoint.com/v2/url?u=http-3A__localhost-3A8080&amp;d=DwMDaQ&amp;c=5VD0RTtNlTh3ycd41b3MUw&amp;r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=kJtGvuus9oDRupym2EBb90B5bKvSi-pPMLdfIXHUGAM&amp;s=r_P53gY50VmvMsyQPhxD35FdzONyzQNBH3GUYTerV4M&amp;e="
              moz-do-not-send="true">
              http://localhost:8080</a>, Don’t see any port as output
            for “npm run-script server”.<span style="font-size:11.0pt"> </span><o:p></o:p></li>
        </ol>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <p>Looks like it is :18898 for you. "Project is running at
      <a class="moz-txt-link-freetext" href="http://localhost:18898/">http://localhost:18898/</a>"<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black">vijaykhemka-mbp:phosphor-webui
            vijaykhemka$ npm run-script server<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black">&gt;
            <a class="moz-txt-link-abbreviated" href="mailto:phosphor-webui@2.8.0-dev">phosphor-webui@2.8.0-dev</a> server
            /Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black">&gt;
            webpack-dev-server --history-api-fallback --inline
            --progress --devtool source-map --mode development<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black"><o:p> </o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.5pt;font-family:Menlo;color:black">10%
              building 1/1 modules 0 active</span></b><span
            style="font-size:8.5pt;font-family:&quot;Apple Color
            Emoji&quot;;color:#5620F4">ℹ</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">
          </span><span style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｢</span><span
            style="font-size:8.5pt;font-family:Menlo;color:#7D7D7D">wds</span><span
            style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｣</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">:
            Project is running at <a class="moz-txt-link-freetext" href="http://localhost:18898/">http://localhost:18898/</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:&quot;Apple Color
            Emoji&quot;;color:#5620F4">ℹ</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">
          </span><span style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｢</span><span
            style="font-size:8.5pt;font-family:Menlo;color:#7D7D7D">wds</span><span
            style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｣</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">:
            webpack output is served from /<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:&quot;Apple Color
            Emoji&quot;;color:#5620F4">ℹ</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">
          </span><span style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｢</span><span
            style="font-size:8.5pt;font-family:Menlo;color:#7D7D7D">wds</span><span
            style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｣</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">:
            Content not from webpack is served from ./src/public<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:&quot;Apple Color
            Emoji&quot;;color:#5620F4">ℹ</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">
          </span><span style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｢</span><span
            style="font-size:8.5pt;font-family:Menlo;color:#7D7D7D">wds</span><span
            style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｣</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">: 404s
            will fallback to /index.html<o:p></o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.5pt;font-family:Menlo;color:black">10%
              building 1/3 modules 2 active
...babel-loader/lib/index.js??ref--4!/Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/webpack-dev-server/client/index.js?<a class="moz-txt-link-freetext" href="http://localhost:18898">http://localhost:18898</a></span></b><span
            style="font-size:8.5pt;font-family:Menlo;color:black">Browserslist:
            caniuse-lite is outdated. Please run next command `npm
            update`<o:p></o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.5pt;font-family:Menlo;color:black">67%
              building 545/571 modules 26 active
/Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/core-js/modules/es.reflect.is-extensible.js</span></b><span
            style="font-size:8.5pt;font-family:Menlo;color:black">[BABEL]
            Note: The code generator has deoptimised the styling of
/Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/angular/angular.js
            as it exceeds the max of 500KB.<o:p></o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.5pt;font-family:Menlo;color:black">66%
              building 557/590 modules 33 active
/Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/core-js/modules/es.object.to-string.js</span></b><span
            style="font-size:8.5pt;font-family:Menlo;color:black">[BABEL]
            Note: The code generator has deoptimised the styling of
/Users/vijaykhemka/proj/lf/gh/new-gh/gh-repo/phosphor-webui/node_modules/text-encoding/lib/encoding-indexes.js
            as it exceeds the max of 500KB.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:&quot;Apple Color
            Emoji&quot;;color:#5620F4">ℹ</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">
          </span><span style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｢</span><span
            style="font-size:8.5pt;font-family:Menlo;color:#7D7D7D">wdm</span><span
            style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｣</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">:   
            761 modules<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:&quot;Apple Color
            Emoji&quot;;color:#5620F4">ℹ</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">
          </span><span style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｢</span><span
            style="font-size:8.5pt;font-family:Menlo;color:#7D7D7D">wdm</span><span
            style="font-size:8.5pt;font-family:&quot;MS
            Mincho&quot;;color:#7D7D7D">｣</span><span
            style="font-size:8.5pt;font-family:Menlo;color:black">:
            Compiled successfully.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black">Regards<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black">-Vijay<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:8.5pt;font-family:Menlo;color:black"><o:p> </o:p></span></p>
        <span style="font-size:11.0pt">
          <o:p></o:p></span>
      </div>
    </blockquote>
  </body>
</html>

--------------DC417965B515E26CCD4C8CA4--

