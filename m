Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7737663D1
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 04:21:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lGqt2QF6zDqlW
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 12:20:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lGpy10jVzDqkw
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 12:20:09 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6C2GpaI000955
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 22:20:04 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tpfh0udmy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 22:20:04 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 12 Jul 2019 03:20:02 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Jul 2019 03:20:00 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6C2JxWu54919406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 02:19:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F1BFA405B;
 Fri, 12 Jul 2019 02:19:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EA16A4054;
 Fri, 12 Jul 2019 02:19:54 +0000 (GMT)
Received: from [9.80.234.146] (unknown [9.80.234.146])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Jul 2019 02:19:54 +0000 (GMT)
Subject: Re: Questions about login with LDAP user.
To: Kevin WM Chen <kevinwm.chen@insyde.com>
References: <f4126378-b2f3-361f-189d-cf22f3f5f119@insyde.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 12 Jul 2019 07:49:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f4126378-b2f3-361f-189d-cf22f3f5f119@insyde.com>
Content-Type: multipart/alternative;
 boundary="------------BC7B930610B9889275724DBA"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071202-0008-0000-0000-000002FC9643
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071202-0009-0000-0000-0000226A005B
Message-Id: <9711f3ee-666c-760c-10e1-b42fc74a3c56@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907120027
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
Cc: "chris.liao" <chris.liao@insyde.com>, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------BC7B930610B9889275724DBA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kevin,

Thanks for sharing the info.

We are in mid of updating the openbmctool for the LDAP,would share the 
commit once it is done.

Regarding the redfish commands, You can use the following link

*https://pastebin.com/ibX5nyAc*

If you still hit the issue, please share the output of the ldapsearch 
command.

eg: ldapsearch -d 2 -H ldap://ldaptest.abc.com/ -x -W -D "<bind_dn>" -b 
"<base_dn>" "(objectclass=*)"

Ratan

On 10/07/19 9:15 AM, Kevin WM Chen wrote:
>
> Hi Ratan,
>
>
> My answers are embedded with your questions as below:
>
> 1. Please get me the redfish commands which you used to configure the 
> LDAP.
>
> Ans: We use openbmctool.py 
> (https://github.com/openbmc/openbmc-tools/blob/master/thalerj/openbmctool.py) 
> to configure LDAP.
>         Due to unfamiliarity with OpenBmc, please help to list the 
> "redfish commands" to configure LDAP.
>
> 2. I just want to know the following info:
> => What is your backend LDAP server(AD/openLDAP)?
>
> Ans: The backend LDAP server we use is openLDAP.
>
> => Did you try to connect your LDAP server with some other external 
> LDAP client? I normally use the ldapsearch(opensource utility).
>        But there are some GUI based clients(jxplorer) also.
>
> Ans: We can use ldapsearch to query the user/group of the bindDN on 
> the server.
>
>
> By the way, we have revised the openbmctool as follows:
>
> As the function "enableLDAP" in openbmctool.py hasn't supported 
> properties "GroupNameAttribute" and "UserNameAttribute" yet,
> we modify the function to accept those two arguments as below.
>
> diff --git a/thalerj/openbmctool.py b/thalerj/openbmctool.py
> index c2bce07..834d812 100755
> --- a/thalerj/openbmctool.py
> +++ b/thalerj/openbmctool.py
> @@ -2595,7 +2595,15 @@ def enableLDAP(host, args, session):
>              'OpenLDAP' : 
> 'xyz.openbmc_project.User.Ldap.Create.Type.OpenLdap'
>              }
>
> -    data = {"data": [args.uri, args.bindDN, args.baseDN, 
> args.bindPassword, scope[args.scope], serverType[args.serverType]]}
> +    usernameAttribute = ""
> +    if args.usernameAttribute:
> +        usernameAttribute = args.usernameAttribute
> +
> +    groupnameAttribute = ""
> +    if args.groupnameAttribute:
> +        groupnameAttribute = args.groupnameAttribute
> +
> +    data = {"data": [args.uri, args.bindDN, args.baseDN, 
> args.bindPassword, scope[args.scope], serverType[args.serverType], 
> usernameAttribute, groupnameAttribute]}
>
>      try:
>          res = session.post(url, headers=jsonHeader, json=data, 
> verify=False, timeout=baseTimeout)
> @@ -3915,6 +3923,8 @@ def createCommandParser():
>              help='Specifies the search scope:subtree, one level or 
> base object.')
>      parser_ldap_config.add_argument("-t", "--serverType", 
> choices=['ActiveDirectory','OpenLDAP'],
>              help='Specifies the configured server is 
> ActiveDirectory(AD) or OpenLdap')
> +    parser_ldap_config.add_argument("-u", "--usernameAttribute", 
> required=True, help="usernameAttribute")
> +    parser_ldap_config.add_argument("-g", "--groupnameAttribute", 
> required=True, help="groupnameAttribute")
>      parser_ldap_config.set_defaults(func=enableLDAP)
>
>      # disable LDAP
>
>
> Thank you.
>
> Kevin WM Chen
>
>
> On 7/8/19 4:27 PM, Ratan Gupta wrote:
>>
>> Hi Kevin,
>>
>> Please get me the redfish commands which you used to configure the LDAP.
>>
>> I just want to know the following info:
>> => What is your backend LDAP server(AD/openLDAP)?
>> => Did you try to connect your LDAP server with some other external 
>> LDAP client? I normally use the ldapsearch(opensource utility).
>>        But there are some GUI based clients(jxplorer) also.
>>
>> Ratan
>>
>> On 05/07/19 3:32 PM, Kevin WM Chen wrote:
>>>
>>> Hi Ratan,
>>>
>>>
>>> This is Kevin with Insyde, a software vendor for BIOS and BMC.
>>>
>>> We are now elaborating on enabling centralized user authentication 
>>> based on LDAP service for OpenBMC v2.6.
>>>
>>> We made some progress but cannot make the user successfully logging 
>>> via bmcweb.
>>>
>>> Our platform to run OpenBMC is ast2500evb.
>>>
>>> The debug log I embedded into bmcweb shows that pam_tally2.so did 
>>> not find LDAP user and this caused login via bmcweb failed.
>>>
>>> The package checkout points is as below:
>>> bmcweb: b97b9c3600
>>> phosphor-user-manager: 95a2931473
>>> phosphor-dbus-interfaces: 096a5af0a3
>>> phosphor-webui: 511a2bbc55
>>>
>>>
>>> Please advise us how to fix the problem, or if there is any document 
>>> available, please let us know.
>>>
>>> Thank you,
>>>
>>>
>>> Kevin WM Chen
>>>
>>> -- 
>>> Kevin WM Chen 陳韋民
>>> Insyde Software Corp.
>>> Email :kevinwm.chen@insyde.com
>>> Tel : +886-2-6608-3688 # 8562
> -- 
> Kevin WM Chen 陳韋民
> Insyde Software Corp.
> Email :kevinwm.chen@insyde.com
> Tel : +886-2-6608-3688 # 8562

--------------BC7B930610B9889275724DBA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font size="+1"><tt>Hi Kevin,</tt></font></p>
    <p><font size="+1"><tt>Thanks for sharing the info</tt></font><tt><font
          size="+1">.</font></tt><br>
    </p>
    <font size="+1"><tt>We are in mid of updating the openbmctool for
        the LDAP,would share the commit once it is done.</tt><tt><br>
      </tt><tt>
      </tt><tt><br>
      </tt><tt>Regarding the redfish commands, You can use the following
        link</tt><tt><br>
      </tt><tt>
      </tt><tt><br>
      </tt><tt><b><a class="moz-txt-link-freetext" href="https://pastebin.com/ibX5nyAc">https://pastebin.com/ibX5nyAc</a></b></tt><tt><br>
      </tt><tt>
      </tt><tt><br>
      </tt><tt>If you still hit the issue, please share the output of
        the ldapsearch command.</tt><tt><br>
      </tt><tt>
      </tt><tt><br>
      </tt><tt>eg: ldapsearch -d 2 -H <a class="moz-txt-link-freetext" href="ldap://ldaptest.abc.com/">ldap://ldaptest.abc.com/</a> -x -W -D
        "&lt;bind_dn&gt;" -b "&lt;base_dn&gt;" "(objectclass=*)"</tt><br>
    </font>
    <pre><font size="+1">Ratan</font></pre>
    <div class="moz-cite-prefix">On 10/07/19 9:15 AM, Kevin WM Chen
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f4126378-b2f3-361f-189d-cf22f3f5f119@insyde.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi Ratan,</p>
      <div><br>
      </div>
      <div>My answers are embedded with your questions as below:</div>
      <div><br>
      </div>
      <div>
        <div>1. Please get me the redfish commands which you used to
          configure the LDAP.</div>
        <div><br>
        </div>
        <div>Ans: We use openbmctool.py
          (<a class="moz-txt-link-freetext"
href="https://github.com/openbmc/openbmc-tools/blob/master/thalerj/openbmctool.py"
            moz-do-not-send="true">https://github.com/openbmc/openbmc-tools/blob/master/thalerj/openbmctool.py</a>)
          to configure LDAP.</div>
        <div>        Due to unfamiliarity with OpenBmc, please help to
          list the "redfish commands" to configure LDAP.</div>
        <div><br>
        </div>
        <div>2. I just want to know the following info:</div>
        <div>=&gt; What is your backend LDAP server(AD/openLDAP)?</div>
        <div><br>
        </div>
        <div>Ans: The backend LDAP server we use is openLDAP.<br>
        </div>
        <div><span style="font-size: 22.3633px;"><br>
          </span></div>
        <div>=&gt; Did you try to connect your LDAP server with some
          other external LDAP client? I normally use the
          ldapsearch(opensource utility).</div>
        <div>       But there are some GUI based clients(jxplorer) also.</div>
      </div>
      <div><br>
      </div>
      <div>Ans: We can use ldapsearch to query the user/group of the
        bindDN on the server.</div>
      <div><br>
      </div>
      <div><br>
      </div>
      <div>By the way, we have revised the openbmctool as follows:</div>
      <div><br>
      </div>
      <div>
        <div>As the function "enableLDAP" in openbmctool.py hasn't
          supported properties "GroupNameAttribute" and
          "UserNameAttribute" yet,</div>
        <div>we modify the function to accept those two arguments as
          below.</div>
        <div><br>
        </div>
        <div>diff --git a/thalerj/openbmctool.py
          b/thalerj/openbmctool.py</div>
        <div>index c2bce07..834d812 100755</div>
        <div>--- a/thalerj/openbmctool.py</div>
        <div>+++ b/thalerj/openbmctool.py</div>
        <div>@@ -2595,7 +2595,15 @@ def enableLDAP(host, args, session):</div>
        <div>             'OpenLDAP' :
          'xyz.openbmc_project.User.Ldap.Create.Type.OpenLdap'</div>
        <div>             }</div>
        <div><br>
        </div>
        <div>-    data = {"data": [args.uri, args.bindDN, args.baseDN,
          args.bindPassword, scope[args.scope],
          serverType[args.serverType]]}</div>
        <div>+    usernameAttribute = ""</div>
        <div>+    if args.usernameAttribute:</div>
        <div>+        usernameAttribute = args.usernameAttribute</div>
        <div>+</div>
        <div>+    groupnameAttribute = ""</div>
        <div>+    if args.groupnameAttribute:</div>
        <div>+        groupnameAttribute = args.groupnameAttribute</div>
        <div>+</div>
        <div>+    data = {"data": [args.uri, args.bindDN, args.baseDN,
          args.bindPassword, scope[args.scope],
          serverType[args.serverType], usernameAttribute,
          groupnameAttribute]}</div>
        <div><br>
        </div>
        <div>     try:</div>
        <div>         res = session.post(url, headers=jsonHeader,
          json=data, verify=False, timeout=baseTimeout)</div>
        <div>@@ -3915,6 +3923,8 @@ def createCommandParser():</div>
        <div>             help='Specifies the search scope:subtree, one
          level or base object.')</div>
        <div>     parser_ldap_config.add_argument("-t", "--serverType",
          choices=['ActiveDirectory','OpenLDAP'],</div>
        <div>             help='Specifies the configured server is
          ActiveDirectory(AD) or OpenLdap')</div>
        <div>+    parser_ldap_config.add_argument("-u",
          "--usernameAttribute", required=True,
          help="usernameAttribute")</div>
        <div>+    parser_ldap_config.add_argument("-g",
          "--groupnameAttribute", required=True,
          help="groupnameAttribute")</div>
        <div>     parser_ldap_config.set_defaults(func=enableLDAP)</div>
        <div><br>
        </div>
        <div>     # disable LDAP</div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>Thank you.</div>
        <div><br>
        </div>
        <div>Kevin WM Chen</div>
        <div><br>
        </div>
        <div><br>
        </div>
      </div>
      <div class="moz-cite-prefix">On 7/8/19 4:27 PM, Ratan Gupta wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:fffcb49e-2d37-f52d-f680-bedc0ca9e826@linux.vnet.ibm.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p><font size="-1">Hi Kevin,</font></p>
        <p><font size="-1">Please get me the redfish commands which you
            used to configure the LDAP.</font></p>
        <font size="-1">I just want to know the following info:<br>
          =&gt; What is your backend LDAP server(AD/openLDAP)?<br>
          =&gt; Did you try to connect your LDAP server with some other
          external LDAP client? I normally use the ldapsearch(opensource
          utility).<br>
                 But there are some GUI based clients(jxplorer) also.</font>
        <p><font size="-1">Ratan</font></p>
        <div class="moz-cite-prefix">On 05/07/19 3:32 PM, Kevin WM Chen
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:ca3c7cba-429c-034c-bd63-0f42c6c5a1a2@insyde.com">
          <meta http-equiv="content-type" content="text/html;
            charset=UTF-8">
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">Hi Ratan,</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;"><br>
          </p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">This is Kevin with Insyde, a
            software vendor for BIOS and BMC.</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">We are now elaborating on
            enabling centralized user authentication based on LDAP
            service for OpenBMC v2.6.</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">We made some progress but
            cannot make the user successfully logging via bmcweb.</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">Our platform to run OpenBMC is
            ast2500evb.</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">The debug log I embedded into
            bmcweb shows that pam_tally2.so did not find LDAP user and
            this caused login via bmcweb failed.</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">The package checkout points is
            as below:<br>
            bmcweb: b97b9c3600<br>
            phosphor-user-manager: 95a2931473<br>
            phosphor-dbus-interfaces: 096a5af0a3<br>
            phosphor-webui: 511a2bbc55</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;"><br>
          </p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">Please advise us how to fix
            the problem, or if there is any document available, please
            let us know.</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">Thank you,</p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;"><br>
          </p>
          <p style="color: rgb(34, 34, 34); font-family: Verdana,
            sans-serif; font-size: 14px;">Kevin WM Chen</p>
          <pre class="moz-signature" cols="72">-- 
Kevin WM Chen 陳韋民
Insyde Software Corp.
Email : <a class="moz-txt-link-abbreviated" href="mailto:kevinwm.chen@insyde.com" moz-do-not-send="true">kevinwm.chen@insyde.com</a>
Tel : +886-2-6608-3688 # 8562
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-signature" cols="72">-- 
Kevin WM Chen 陳韋民
Insyde Software Corp.
Email : <a class="moz-txt-link-abbreviated" href="mailto:kevinwm.chen@insyde.com" moz-do-not-send="true">kevinwm.chen@insyde.com</a>
Tel : +886-2-6608-3688 # 8562
</pre>
    </blockquote>
  </body>
</html>

--------------BC7B930610B9889275724DBA--

