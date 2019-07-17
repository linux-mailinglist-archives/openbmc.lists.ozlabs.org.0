Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D60616D97B
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 05:48:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qcR20N7lzDqcv
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 13:47:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zd-tech.com.cn
 (client-ip=220.181.97.139; helo=m97139.mail.qiye.163.com;
 envelope-from=rxsun@zd-tech.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=zd-tech.com.cn
Received: from m97139.mail.qiye.163.com (m97139.mail.qiye.163.com
 [220.181.97.139])
 by lists.ozlabs.org (Postfix) with ESMTP id 45pWdL2VMDzDqMd
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 19:07:57 +1000 (AEST)
Received: from [192.168.200.84] (unknown [218.247.145.4])
 by smtp10 (Coremail) with SMTP id vOCowACnz+9a5S5dbbgOAA--.93S2;
 Wed, 17 Jul 2019 17:07:39 +0800 (CST)
Subject: Re: Network Settings GUI
To: Jandra A <jandraara@gmail.com>
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
 <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
 <CAMTupoTUFv3TCY=D8OatOTCeoBdCsbqXVep5ZM6vXdJ1EGgr-A@mail.gmail.com>
 <181ab467.6aa8.16b8d45bb45.Coremail.rxsun@zd-tech.com.cn>
 <CAMTupoT26K4x4RB+=DiEphFfKZWhBm-ysb17J+thmuxkTVJodQ@mail.gmail.com>
 <14DDB6E3-8F8F-4536-835A-35B7D2AD3A76@zd-tech.com.cn>
 <CAMTupoQuwmjkpfF-f7CS7XNw1bT-bzZ5xqW2deVPqT7hPHe6dA@mail.gmail.com>
 <d72c930c-b170-d706-0bc2-6d1c2122cc69@zd-tech.com.cn>
 <CAMTupoRCx1vvAfbhmjzBTmmg6_5Y=MhjwvHw29eEcAc5sJJVPQ@mail.gmail.com>
 <bda55054-71e9-c1eb-e65f-d14e207ac0b5@zd-tech.com.cn>
 <CAMTupoQszBizz56n=Dps4fcGQoORw2kDcgjfxy4bvGK1cUomFQ@mail.gmail.com>
From: =?UTF-8?B?5a2Z55Ge6Zye?= <rxsun@zd-tech.com.cn>
Message-ID: <002e25cd-82b1-9e21-0711-9aecc1572b8e@zd-tech.com.cn>
Date: Wed, 17 Jul 2019 17:07:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMTupoQszBizz56n=Dps4fcGQoORw2kDcgjfxy4bvGK1cUomFQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A34F6EE692F8E972C50AB58C"
Content-Language: en-US
X-CM-TRANSID: vOCowACnz+9a5S5dbbgOAA--.93S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GrWDJw1rAr15XF45Gw4rXwb_yoWxXw4UpF
 ZxGF4qyrWDKFy7Awn7Zws8ZrWF9rZ5GFy3GFykKr98Cw15WFyxJry0vasIqF1UWws7Jryj
 qrWjqF1Uua15ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU24E_UUUUU=
X-Originating-IP: [218.247.145.4]
X-CM-SenderInfo: pu0v30o62gg3xhfkhulrpou0/1tbiPx-0hVbdGumPaAAAsO
X-Mailman-Approved-At: Fri, 19 Jul 2019 13:47:24 +1000
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
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 Derick <derick.montague@gmail.com>, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------A34F6EE692F8E972C50AB58C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jandra，

It'd be better to have FGDN, but we can do without right now. Hope that 
we'll have it in the future.

The other entries in your email are consistent with our understanding.

Thanks for your reply.

Ruixia,Sun.


在 2019/7/17 上午4:22, Jandra A 写道:
> Hi Ruixia,
>
> Thanks for the clarification. I wanted to let you know we are still 
> working on this and hoping to get it to you all as soon as we can. I 
> want to make sure we are understanding the requirements for Lenovo:
>
> - Need the ability to support both IPV4 and IPV6 simultaneously on a 
> single interface.
> - In the case the both IPV4 and IPV6 are enabled in a single 
> interface, zero-configuration cannot assign addresses to either.
> - The format for IPV6 DNS servers is the same as IPV6 IP addresses. Do 
> each of these also have a Fully Qualified Domain Name (FQDN)?
> - Only two IP addresses maximum (in addition to those provided by 
> zero-config, if any) will be supported per interface. If there are 
> two, one must be IPV4 and one must be IPV6.
> - For IPV6, we will support either DHCP or static configurations, not 
> both at the same time on the same interface. Same applies for IPV6, 
> though IPV4 can be different from IPV6.
>
> Thank you for your patience with us.
>
> Regards,
> Jandra Aranguren
>
> On Wed, Jul 3, 2019 at 12:49 AM 孙瑞霞 <rxsun@zd-tech.com.cn 
> <mailto:rxsun@zd-tech.com.cn>> wrote:
>
>     Hi Jandra,
>     >>In the case that DHCP doesn't give either， both IPV4 and IPV6
>     are enabled.
>     >>In the case that IPV6 DHCP is given ,IPV6 are disabled,so are IPV4.
>
>     >Can you clarify this? I do not follow.
>
>     when both IPV4 and IPV6 are enabled and DHCP is disabled and the
>     user input nothing to IPV4 and IPV6 address input box
>     （zeroconf）,in this case,it shall not to assign any IP address to
>     bmc network device, the webui should give an error tips to users.
>
>     It only works when the user input the correct format IP address.
>     PS:Having a check box to enable ipv4 and ipv6 configuration would
>     be better.
>     One useful
>     link:https://support.code42.com/Administrator/6/Configuring/How_to_use_both_IPv4_and_IPv6_in_your_Code42_environment
>     Best,
>     Ruixia
>
>     在 2019/7/2 下午8:57, Jandra A 写道:
>>
>>           * In the case that DHCP doesn't give either， both IPV4 and
>>             IPV6 are enabled.
>>
>>           * In the case that IPV6 DHCP is given ,IPV6 are disabled,so
>>             are IPV4.
>>
>>
>>     Can you clarify this? I do not follow.
>>
>>     On Tue, Jul 2, 2019 at 3:14 AM 孙瑞霞 <rxsun@zd-tech.com.cn
>>     <mailto:rxsun@zd-tech.com.cn>> wrote:
>>
>>         Hi，
>>
>>         The following item is expected,
>>
>>           * In the case that DHCP doesn't give either， both IPV4 and
>>             IPV6 are enabled.
>>
>>           * In the case that IPV6 DHCP is given ,IPV6 are disabled,so
>>             are IPV4.
>>
>>           * IPV6 DNS servers  is in the format of an IPV6 IP address.
>>
>>         it will be similar with the picture below, maybe.
>>
>>
>>         Best regard, thanks.
>>
>>         ruixia,sun.
>>
>>
>>         在 2019/7/1 下午11:26, Jandra A 写道:
>>>         Ruixia -- I am waiting on a couple of responses from our
>>>         backend team to be able to provide a design that aligns with
>>>         how the functionality is developed.
>>>
>>>         Ratan -- I'm helping create the design mockup for including
>>>         IPV6 in the Network settings panel so that Lenovo can do the
>>>         front-end implementation. Do you know if the work your team
>>>         was doing for this will be merged to the master soon?
>>>
>>>         I have some questions I am hoping you can help answer for
>>>         this IPV6 design:
>>>         - What happens to zeroconf when both IPV4 and IPV6 are
>>>         enabled? Does it try to assign an IP address to both (in the
>>>         case that DHCP doesn't give either) or does it only assign
>>>         either an IPV4 IP address or an IPV6 IP address?
>>>         - What is the format of IPV6 DNS servers? Is that also in
>>>         the format of an IPV6 IP address?
>>>
>>>             I have built the latest openbmc project image by adding
>>>             the option "ipv6" in the term DISTRO_FEATURES_DEFAULT in
>>>             the file
>>>             /meta-phosphor/conf/distro/include/phosphor-base.inc. I
>>>             can ping the openbmc  IPV6 IP successfully, but cannot
>>>             login to it by openssh command.
>>>             It seemed that there are some works on openbmc embedded
>>>             OS to support IPV6.
>>>             Another issue from Ruixia is the IPV6 Dbus Interfaces
>>>             design, I found there are some IPV6 rest-Dbus or Redfish
>>>             interfaces on yaml files available. I don' t know is it
>>>             enough to the IPV6 webui.
>>>
>>>
>>>         Ratan, would you be able to help Ruixia and Xiuzhi with this?
>>>
>>>         Regards,
>>>         Jandra Aranguren
>>>
>>>
>>>         On Mon, Jul 1, 2019 at 9:27 AM 孙瑞霞 <rxsun@zd-tech.com.cn
>>>         <mailto:rxsun@zd-tech.com.cn>> wrote:
>>>
>>>             hi，
>>>             After the meeting of last week，I was expecting the email
>>>             about ipv6 ui designing and ipv6 interface with web
>>>             server ，when will I receive it？Should we have another
>>>             meeting this week？
>>>             best regard！
>>>
>>>             ruixia，sun
>>>
>>>
>>>             	
>>>             孙瑞霞
>>>             邮箱：rxsun@zd-tech.com.cn
>>>
>>>             <https://maas.mail.163.com/dashi-web-extend/html/proSignature.html?iconUrl=https%3A%2F%2Fmail-online.nosdn.127.net%2Fqiyelogo%2FdefaultAvatar.png&name=%E5%AD%99%E7%91%9E%E9%9C%9E&uid=example%40163.com&ftlId=3&items=%5B%22%E9%82%AE%E7%AE%B1%EF%BC%9Arxsun%40zd-tech.com.cn%22%5D>
>>>
>>>
>>>             签名由 网易邮箱大师
>>>             <https://mail.163.com/dashi/dlpro.html?from=mail88> 定制
>>>
>>>             On 06/25/2019 23:25, Jandra A
>>>             <mailto:jandraara@gmail.com> wrote:
>>>
>>>                 Great, let's meet using my webex
>>>                 https://ibm.webex.com/meet/jandra.aranguren I will
>>>                 send you an invite as well.
>>>
>>>                 On Tue, Jun 25, 2019 at 1:16 AM 孙瑞霞
>>>                 <rxsun@zd-tech.com.cn <mailto:rxsun@zd-tech.com.cn>>
>>>                 wrote:
>>>
>>>                     Hi,all,
>>>                     I will be glad to meet at 7:00AM Central time
>>>                     this Wednesday (June 26th).
>>>
>>>                     Ruixia,Sun
>>>
>>>
>>>
>>>                     发件人："Jandra A" <jandraara@gmail.com
>>>                     <mailto:jandraara@gmail.com>>
>>>                     发送日期：2019-06-25 00:51:39
>>>                     收件人：xiuzhi <1450335857@qq.com
>>>                     <mailto:1450335857@qq.com>>
>>>                     抄送人：Derick <derick.montague@gmail.com
>>>                     <mailto:derick.montague@gmail.com>>,openbmc
>>>                     <openbmc@lists.ozlabs.org
>>>                     <mailto:openbmc@lists.ozlabs.org>>,rxsun
>>>                     <rxsun@zd-tech.com.cn <mailto:rxsun@zd-tech.com.cn>>
>>>                     主题：Re: Re: Network Settings GUI
>>>
>>>                         Hi Xiuzhi and Ruixia,
>>>
>>>                         It would be great to set some time to align
>>>                         on the requirements from design and how to
>>>                         work together so that your team can start on
>>>                         the so front-end development.
>>>
>>>                         Like Derick said, we meet every other
>>>                         Wednesday at 10:00 Central time to discuss
>>>                         GUI issues, with the next one being next
>>>                         Wednesday (July 3rd). Hopefully you can make
>>>                         that.
>>>
>>>                         If you cannot, I am happy to meet at 7:00 or
>>>                         8:00 AM Central time this Wednesday (June
>>>                         26th) or Friday (June 28th). Please let me
>>>                         know.
>>>
>>>                         Regards,
>>>
>>>                         On Wed, Jun 19, 2019 at 8:30 PM xiuzhi
>>>                         <1450335857@qq.com
>>>                         <mailto:1450335857@qq.com>> wrote:
>>>
>>>                             Hi Derick,
>>>                             >> The IPV6 webui should support both
>>>                             IPV4 and IPV6 on a single interface at
>>>                             the same time and users can set IPV4 and
>>>                             IPV6 on the same network webpage from
>>>                             Lenovo test cases.
>>>
>>>                             >Thank you!
>>>
>>>                             >>  Ruixia (her email:
>>>                             rxsun@zd-tech.com.cn
>>>                             <mailto:rxsun@zd-tech.com.cn>;), form my
>>>                             team can do front-end  to implement your
>>>                             design .  It would be best if the IPV6
>>>                             feature could be achieved in one to two
>>>                             months.
>>>
>>>                             >It would be great if she were able to
>>>                             join our GUI Community
>>>                             workgroup. It's every other Wednesday at
>>>                             10:00 Central Time. We use
>>>                             these to discuss all the GUI issues.
>>>                             Where are you located?
>>>                               I am in BeiJing  UTC+8. The meeting
>>>                             time is  Wednesday  23:00 Beijing Time
>>>                             (Wednesday 10:00 am Central Daylight
>>>                             Time),isn't it?
>>>                             >GUI Community Workgroup Wiki:
>>>                             https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>>>
>>>                             Best,
>>>                             Xiuzhi
>>>

--------------A34F6EE692F8E972C50AB58C
Content-Type: multipart/related;
 boundary="------------7AB4D1F0CDF90CAC96C24668"


--------------7AB4D1F0CDF90CAC96C24668
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jandra，</p>
    <pre class="js_message_plain ng-binding" style="margin: 0px; font-family: inherit; font-size: 14px; white-space: pre-wrap; word-break: normal; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><font size="+1">	It'd be better to have FGDN, but we can do without right now. Hope that we'll have it in the future. </font></pre>
    <pre class="js_message_plain ng-binding" style="margin: 0px; font-family: inherit; font-size: 14px; white-space: pre-wrap; word-break: normal; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><font size="+1">	The other entries in your email are consistent with our understanding.</font></pre>
    <p>Thanks for your reply.</p>
    <p>Ruixia,Sun.</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2019/7/17 上午4:22, Jandra A 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMTupoQszBizz56n=Dps4fcGQoORw2kDcgjfxy4bvGK1cUomFQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi Ruixia, 
        <div><br>
        </div>
        <div>Thanks for the clarification. I wanted to let you know we
          are still working on this and hoping to get it to you all as
          soon as we can. I want to make sure we are understanding the
          requirements for Lenovo:</div>
        <div><br>
        </div>
        <div>- Need the ability to support both IPV4 and IPV6
          simultaneously on a single interface.</div>
        <div>- In the case the both IPV4 and IPV6 are enabled in a
          single interface, zero-configuration cannot assign addresses
          to either. </div>
        <div>- The format for IPV6 DNS servers is the same as IPV6 IP
          addresses. Do each of these also have a Fully Qualified Domain
          Name (FQDN)? </div>
        <div>- Only two IP addresses maximum (in addition to those
          provided by zero-config, if any) will be supported per
          interface. If there are two, one must be IPV4 and one must be
          IPV6. </div>
        <div>- For IPV6, we will support either DHCP or static
          configurations, not both at the same time on the same
          interface. Same applies for IPV6, though IPV4 can be different
          from IPV6. </div>
        <div><br>
        </div>
        <div>Thank you for your patience with us. </div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Jandra Aranguren</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Jul 3, 2019 at 12:49
          AM 孙瑞霞 &lt;<a href="mailto:rxsun@zd-tech.com.cn"
            moz-do-not-send="true">rxsun@zd-tech.com.cn</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div bgcolor="#FFFFFF">
            <p>Hi Jandra,<br>
              &gt;&gt;In the case that DHCP doesn't give either， both
              IPV4 and IPV6 are enabled.<br>
              &gt;&gt;In the case that IPV6 DHCP is given ,IPV6 are
              disabled,so are IPV4.<br>
              <br>
              &gt;Can you clarify this? I do not follow.<br>
              <br>
              when both IPV4 and IPV6 are enabled and DHCP is disabled
              and the user input nothing to IPV4 and IPV6 address input
              box （zeroconf）,in this case,it shall not to assign any IP
              address to bmc network device, the webui should give an
              error tips to users.<br>
              <br>
              It only works when the user input the correct format IP
              address.<br>
              PS:Having a check box to enable ipv4 and ipv6
              configuration would be better.<br>
              One useful
              link:<a
                class="gmail-m_2327925860975938968moz-txt-link-freetext"
href="https://support.code42.com/Administrator/6/Configuring/How_to_use_both_IPv4_and_IPv6_in_your_Code42_environment"
                target="_blank" moz-do-not-send="true">https://support.code42.com/Administrator/6/Configuring/How_to_use_both_IPv4_and_IPv6_in_your_Code42_environment</a><br>
              Best,<br>
              Ruixia<br>
              <br>
            </p>
            <div class="gmail-m_2327925860975938968moz-cite-prefix">在
              2019/7/2 下午8:57, Jandra A 写道:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  <ul>
                    <li style="margin-left:15px">In the case that DHCP
                      doesn't give either， both IPV4 and IPV6 are
                      enabled.</li>
                  </ul>
                  <ul>
                    <li style="margin-left:15px">In the case that IPV6
                      DHCP is given ,IPV6 are disabled,so are IPV4.</li>
                  </ul>
                </blockquote>
                <div><br>
                </div>
                <div>Can you clarify this? I do not follow.  </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Tue, Jul 2, 2019 at
                  3:14 AM 孙瑞霞 &lt;<a href="mailto:rxsun@zd-tech.com.cn"
                    target="_blank" moz-do-not-send="true">rxsun@zd-tech.com.cn</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  <div bgcolor="#FFFFFF">
                    <p>Hi，</p>
                    <p>The following item is expected,<br>
                    </p>
                    <ul>
                      <li>In the case that DHCP doesn't give either，
                        both IPV4 and IPV6 are enabled.</li>
                    </ul>
                    <ul>
                      <li>In the case that IPV6 DHCP is given ,IPV6 are
                        disabled,so are IPV4.<br>
                      </li>
                    </ul>
                    <ul>
                      <li> IPV6 DNS servers  is in the format of an IPV6
                        IP address.</li>
                    </ul>
                    <p>it will be similar with the picture below, maybe.<br>
                    </p>
                    <img
                      src="cid:part4.14972492.08ED4049@zd-tech.com.cn"
                      alt="" class="" width="509" height="509"><br>
                    <p>Best regard, thanks.</p>
                    <p>ruixia,sun.</p>
                    <p><br>
                    </p>
                    <div
class="gmail-m_2327925860975938968gmail-m_8207711357368344562moz-cite-prefix">在
                      2019/7/1 下午11:26, Jandra A 写道:<br>
                    </div>
                    <blockquote type="cite">
                      <div dir="ltr">
                        <div>Ruixia -- I am waiting on a couple of
                          responses from our backend team to be able to
                          provide a design that aligns with how the
                          functionality is developed. </div>
                        <div><br>
                        </div>
                        <div>Ratan -- I'm helping create the design
                          mockup for including IPV6 in the Network
                          settings panel so that Lenovo can do the
                          front-end implementation. Do you know if the
                          work your team was doing for this will be
                          merged to the master soon?</div>
                        <br>
                        I have some questions I am hoping you can help
                        answer for this IPV6 design: 
                        <div>- What happens to zeroconf when both IPV4
                          and IPV6 are enabled? Does it try to assign an
                          IP address to both (in the case that DHCP
                          doesn't give either) or does it only assign
                          either an IPV4 IP address or an IPV6 IP
                          address?
                          <div>- What is the format of IPV6 DNS servers?
                            Is that also in the format of an IPV6 IP
                            address?<br>
                            <br>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex"><span
                                class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-im"
                                style="color:rgb(80,0,80)">I have built
                                the latest openbmc project image by
                                adding the option "ipv6" in the term
                                DISTRO_FEATURES_DEFAULT in the file
                                /meta-phosphor/conf/distro/include/phosphor-base.inc.
                                I can ping the openbmc  IPV6 IP
                                successfully, but cannot login to it by
                                openssh command.<br>
                                It seemed that there are some works on
                                openbmc embedded OS to support IPV6.<br>
                                Another issue from Ruixia is the IPV6
                                Dbus Interfaces design, I found there
                                are some IPV6 rest-Dbus or Redfish
                                interfaces on yaml files available. I
                                don' t know is it enough to the IPV6
                                webui.</span></blockquote>
                            <div><br>
                            </div>
                            Ratan, would you be able to help Ruixia and
                            Xiuzhi with this?</div>
                          <div><br>
                          </div>
                          <div>Regards,</div>
                          <div>Jandra Aranguren </div>
                          <div
                            class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-yj6qo
gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-ajU"
                            style="outline:none;padding:10px
                            0px;width:22px;margin:2px 0px 0px"><br
class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-Apple-interchange-newline">
                          </div>
                        </div>
                      </div>
                      <br>
                      <div class="gmail_quote">
                        <div dir="ltr" class="gmail_attr">On Mon, Jul 1,
                          2019 at 9:27 AM 孙瑞霞 &lt;<a
                            href="mailto:rxsun@zd-tech.com.cn"
                            target="_blank" moz-do-not-send="true">rxsun@zd-tech.com.cn</a>&gt;
                          wrote:<br>
                        </div>
                        <blockquote class="gmail_quote"
                          style="margin:0px 0px 0px
                          0.8ex;border-left:1px solid
                          rgb(204,204,204);padding-left:1ex">
                          <div>
                            <div
id="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851contentDescription"
                              style="line-height:1.5;text-align:justify">
                              <div
id="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851imail_extraContent">hi，
                                <br>
                                After the meeting of last week，I was
                                expecting the email about ipv6 ui
                                designing and ipv6 interface with web
                                server ，when will I receive it？Should we
                                have another meeting this week？ <br>
                                best regard！ <br>
                                <br>
                                ruixia，sun</div>
                              <div><br>
                              </div>
                              <div><br>
                              </div>
                              <div
class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851NETEASEMAILMASTERLOCALSIGNATURE">
                                <div
id="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851imail_signature">
                                  <div style="margin:0px;padding:0px"> <a
href="https://maas.mail.163.com/dashi-web-extend/html/proSignature.html?iconUrl=https%3A%2F%2Fmail-online.nosdn.127.net%2Fqiyelogo%2FdefaultAvatar.png&amp;name=%E5%AD%99%E7%91%9E%E9%9C%9E&amp;uid=example%40163.com&amp;ftlId=3&amp;items=%5B%22%E9%82%AE%E7%AE%B1%EF%BC%9Arxsun%40zd-tech.com.cn%22%5D"
                                      width="400"
style="display:block;max-width:400px;background:rgb(255,255,255);padding:15px
                                      0px
                                      10px;text-decoration:none;outline:none"
                                      target="_blank"
                                      moz-do-not-send="true">
                                      <table
style="width:100%;max-width:100%;table-layout:fixed;border-collapse:collapse;border-spacing:0px;line-height:1.3;color:rgb(155,158,161);font-size:14px"
                                        cellpadding="0">
                                        <tbody>
                                          <tr>
                                            <td style="padding:0px 7px
                                              0px
                                              0px;box-sizing:border-box;width:45px"
                                              width="45"> <img
                                                style="width: 38px;
                                                height: 38px;
                                                border-radius: 50%;"
                                                src="https://mail-online.nosdn.127.net/qiyelogo/defaultAvatar.png"
                                                moz-do-not-send="true"
                                                width="38" height="38">
                                            </td>
                                            <td style="padding:0px 0px
                                              0px 7px">
                                              <div
                                                style="max-width:380px">
                                                <div
style="box-sizing:border-box;padding-right:35px;font-size:16px;margin-bottom:5px;color:rgb(49,53,59);font-weight:bold;width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis">孙瑞霞</div>
                                                <div
                                                  style="font-size:0px;line-height:0">
                                                </div>
                                                <div
                                                  style="word-break:break-all">
邮箱：rxsun@zd-tech.com.cn </div>
                                              </div>
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </a> </div>
                                  <div>
                                    <p style="border-top:1px solid
rgb(229,229,229);padding-top:8px;font-size:12px;color:rgb(182,184,187);line-height:1.833">签名由
                                      <a
                                        href="https://mail.163.com/dashi/dlpro.html?from=mail88"
style="color:rgb(106,168,246);text-decoration:none" target="_blank"
                                        moz-do-not-send="true">网易邮箱大师</a>
                                      定制</p>
                                  </div>
                                </div>
                              </div>
                              <div
class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851J-reply"
style="background-color:rgb(242,242,242);color:black;padding-top:6px;padding-bottom:6px;border-radius:3px;margin-top:45px;margin-bottom:20px">
                                <div
style="font-size:14px;line-height:1.5;word-break:break-all;margin-left:10px;margin-right:10px">On
                                  <span
class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851mail-date">06/25/2019
                                    23:25</span>, <a
class="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851mail-to"
style="text-decoration:none;color:rgb(42,151,255)"
                                    href="mailto:jandraara@gmail.com"
                                    target="_blank"
                                    moz-do-not-send="true">Jandra A</a>
                                  wrote: </div>
                              </div>
                              <blockquote
id="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851ntes-iosmail-quote"
                                style="margin:0px">
                                <div dir="ltr">Great, let's meet using
                                  my webex <a
                                    href="https://ibm.webex.com/meet/jandra.aranguren"
                                    target="_blank"
                                    moz-do-not-send="true">https://ibm.webex.com/meet/jandra.aranguren</a> I
                                  will send you an invite as well. </div>
                                <br>
                                <div class="gmail_quote">
                                  <div dir="ltr" class="gmail_attr">On
                                    Tue, Jun 25, 2019 at 1:16 AM 孙瑞霞
                                    &lt;<a
                                      href="mailto:rxsun@zd-tech.com.cn"
                                      target="_blank"
                                      moz-do-not-send="true">rxsun@zd-tech.com.cn</a>&gt;
                                    wrote:<br>
                                  </div>
                                  <blockquote class="gmail_quote"
                                    style="margin:0px 0px 0px
                                    0.8ex;border-left:1px solid
                                    rgb(204,204,204);padding-left:1ex">
                                    <div
style="line-height:1.7;color:rgb(0,0,0);font-size:14px;font-family:Arial">
                                      <div>Hi,all,</div>
                                      <div>I will be glad to meet at
                                        7:00AM Central time this
                                        Wednesday (June 26th).</div>
                                      <div><br>
                                      </div>
                                      <div>Ruixia,Sun</div>
                                      <br>
                                      <br>
                                      <br>
                                      发件人："Jandra A" &lt;<a
                                        href="mailto:jandraara@gmail.com"
                                        target="_blank"
                                        moz-do-not-send="true">jandraara@gmail.com</a>&gt;<br>
                                      发送日期：2019-06-25 00:51:39<br>
                                      收件人：xiuzhi &lt;<a
                                        href="mailto:1450335857@qq.com"
                                        target="_blank"
                                        moz-do-not-send="true">1450335857@qq.com</a>&gt;<br>
                                      抄送人：Derick &lt;<a
                                        href="mailto:derick.montague@gmail.com"
                                        target="_blank"
                                        moz-do-not-send="true">derick.montague@gmail.com</a>&gt;,openbmc
                                      &lt;<a
                                        href="mailto:openbmc@lists.ozlabs.org"
                                        target="_blank"
                                        moz-do-not-send="true">openbmc@lists.ozlabs.org</a>&gt;,rxsun
                                      &lt;<a
                                        href="mailto:rxsun@zd-tech.com.cn"
                                        target="_blank"
                                        moz-do-not-send="true">rxsun@zd-tech.com.cn</a>&gt;<br>
                                      主题：Re: Re: Network Settings GUI<br>
                                      <blockquote
id="gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-m_1619914329257948851gmail-m_-8231268627540647716isReplyContent"
style="padding-left:1ex;margin:0px 0px 0px 0.8ex;border-left:1px solid
                                        rgb(204,204,204)">
                                        <div dir="ltr">Hi Xiuzhi and
                                          Ruixia, 
                                          <div><br>
                                          </div>
                                          <div>It would be great to set
                                            some time to align on the
                                            requirements from design and
                                            how to work together so that
                                            your team can start on the
                                            so front-end development.  <br>
                                            <br>
                                            Like Derick said, we meet
                                            every other Wednesday at
                                            10:00 Central time to
                                            discuss GUI issues, with the
                                            next one being next
                                            Wednesday (July 3rd).
                                            Hopefully you can make
                                            that. </div>
                                          <div><br>
                                          </div>
                                          <div>If you cannot, I am happy
                                            to meet at 7:00 or 8:00 AM
                                            Central time this Wednesday
                                            (June 26th) or Friday (June
                                            28th). Please let me know. </div>
                                          <div><br>
                                          </div>
                                          <div>Regards,</div>
                                        </div>
                                        <br>
                                        <div class="gmail_quote">
                                          <div dir="ltr"
                                            class="gmail_attr">On Wed,
                                            Jun 19, 2019 at 8:30 PM
                                            xiuzhi &lt;<a
                                              href="mailto:1450335857@qq.com"
                                              target="_blank"
                                              moz-do-not-send="true">1450335857@qq.com</a>&gt;
                                            wrote:<br>
                                          </div>
                                          <blockquote
                                            class="gmail_quote"
                                            style="margin:0px 0px 0px
                                            0.8ex;border-left:1px solid
rgb(204,204,204);padding-left:1ex">
                                            <div>Hi Derick,</div>
                                            <div>&gt;&gt; The IPV6 webui
                                              should support both IPV4
                                              and IPV6 on a single
                                              interface at the same time
                                              and users can set IPV4 and
                                              IPV6 on the same network
                                              webpage from Lenovo test
                                              cases.</div>
                                            <div><br>
                                              &gt;Thank you!<br>
                                              <br>
                                              &gt;&gt;  Ruixia (her
                                              email: <a
                                                href="mailto:rxsun@zd-tech.com.cn"
                                                target="_blank"
                                                moz-do-not-send="true">rxsun@zd-tech.com.cn</a>;),
                                              form my team can do 
                                              front-end  to implement
                                              your design .  It would be
                                              best if the IPV6 feature
                                              could be achieved in one
                                              to two months.<br>
                                              <br>
                                              &gt;It would be great if
                                              she were able to join our
                                              GUI Community<br>
                                              workgroup. It's every
                                              other Wednesday at 10:00
                                              Central Time. We use<br>
                                              these to discuss all the
                                              GUI issues. Where are you
                                              located?<br>
                                                I am in BeiJing  UTC+8.
                                              The meeting time
                                              is  Wednesday  23:00
                                              Beijing Time (Wednesday
                                              10:00 am <span
                                                style="font-family:Arial,Helvetica,sans-serif;font-size:17px">Central
                                                Daylight Time</span>),isn't
                                              it?</div>
                                            <div>&gt;GUI Community
                                              Workgroup Wiki:<br>
                                              <a
                                                href="https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group"
                                                target="_blank"
                                                moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a><br>
                                            </div>
                                            <div><br>
                                            </div>
                                            <div>Best,</div>
                                            <div>Xiuzhi</div>
                                          </blockquote>
                                        </div>
                                      </blockquote>
                                    </div>
                                  </blockquote>
                                </div>
                              </blockquote>
                            </div>
                          </div>
                        </blockquote>
                      </div>
                    </blockquote>
                  </div>
                </blockquote>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------7AB4D1F0CDF90CAC96C24668
Content-Type: image/jpeg;
 name="1935163017.jpg"
Content-Transfer-Encoding: base64
Content-ID: <part4.14972492.08ED4049@zd-tech.com.cn>
Content-Disposition: inline;
 filename="1935163017.jpg"

/9j/4AAQSkZJRgABAQAAAQABAAD/4QBoRXhpZgAASUkqAAgAAAADABIBAwABAAAAAQAAADEB
AgAQAAAAMgAAAGmHBAABAAAAQgAAAAAAAABTaG90d2VsbCAwLjIyLjAAAgACoAkAAQAAAP0B
AAADoAkAAQAAAP0BAAAAAAAA/+EJ9Gh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94
cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6
eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNC40
LjAtRXhpdjIiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkv
MDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4
bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyIgeG1sbnM6dGlmZj0i
aHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI1
MDkiIGV4aWY6UGl4ZWxZRGltZW5zaW9uPSI1MDkiIHRpZmY6SW1hZ2VXaWR0aD0iNTA5IiB0
aWZmOkltYWdlSGVpZ2h0PSI1MDkiIHRpZmY6T3JpZW50YXRpb249IjEiLz4gPC9yZGY6UkRG
PiA8L3g6eG1wbWV0YT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8P3hwYWNrZXQgZW5kPSJ3Ij8+/9sAQwADAgIDAgIDAwMDBAMDBAUIBQUE
BAUKBwcGCAwKDAwLCgsLDQ4SEA0OEQ4LCxAWEBETFBUVFQwPFxgWFBgSFBUU/9sAQwEDBAQF
BAUJBQUJFA0LDRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU
FBQUFBQU/8AAEQgB/QH9AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYH
CAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEV
UtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0
dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV
1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYH
CAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkj
M1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpz
dHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT
1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A+MyMZOCBu28npxnr+n1N
dT4K/wBfD/19L/Sq/j/WtN8QeKrq90my+wWkiqu08NKyr80jL0GSM8Yqx4K/18P/AF9L/SgD
95R/F/nsKcv3h9aaP4v89hTl+8PrQBNZnbbZ9M14/wCIf2gZ9E+F2peJl0y3k1KPWrvRrKxe
ZlW4kiuJY15xnJSItxmvYLP/AI9eu3rz6Vy1j4R8DaTrLatY6RoFjqryvcNewW0Mc7SNuDOX
C7iTuYEk87jQB51pv7TsWq+OLLRrfTIn07U76ztdL1Dzj/pKyWwuJdy4+R1V4yF53DeeNprU
l/aOsdI1jWNP1TR72WSy1Ke2STThG6fZ0MC+c+91Od1wg2qGJzwCOa7Wy8NeC9Mjgjs9N0O0
iguBdRRwQwoscwTYJFAHyuF43DBxxnFOl8O+DZ7m5uJdO0OWa5LNM7wQkyFihcsSvJYxxk56
7F9KAOHs/wBpvRpNXtNLvND1ezv7rUrrT4owsEmRBcC3eY7ZT8hkOABub5Sdu3BONN+0rJPr
+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
ASTQBxdp8eLmPxNpujap4d+xPNefYLqeG5eaOOYy+UnlN5QEg3lN24oVD5AbBx67XK6Z8L/D
Wj3GmzWunFG04s1srXErojMWJcqzEM5Lt87At8x5rqqACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii
gAooooAKKKKACiiigAooooAKKKKACiiigD+d+uq8Ff6+H/r6X+lcrXVeCv8AXw/9fS/0oA/e
Ufxf57CnL94fWmj+L/PYU5fvD60AT2P/AB7j6mrFV7I4t89eTUnm4/gf8qAJKKi+0D+4/wD3
zR9oH9x/++aAJaKi+0D+4/8A3zR9oH9x/wDvmgCWiovtA/uP/wB80faB/cf/AL5oAloqL7QP
7j/980faB/cf/vmgCWiovtA/uP8A980faB/cf/vmgCWiovtA/uP/AN80faB/cf8A75oAloqL
7QP7j/8AfNH2gf3H/wC+aAJaKi+0D+4//fNH2gf3H/75oAloqL7QP7j/APfNH2gf3H/75oAl
oqL7QP7j/wDfNH2gf3H/AO+aAJaKi+0D+4//AHzR9oH9x/8AvmgCWiovtA/uP/3zR9oH9x/+
+aAJaKi+0D+4/wD3zR9oH9x/++aAJaKi+0D+4/8A3zR9oH9x/wDvmgCWiovtA/uP/wB80faB
/cf/AL5oAloqL7QP7j/980faB/cf/vmgCWiovtA/uP8A980faB/cf/vmgCWiovtA/uP/AN80
faB/cf8A75oAloqL7QP7j/8AfNH2gf3H/wC+aAJaKi+0D+4//fNH2gf3H/75oAloqL7QP7j/
APfNH2gf3H/75oAloqL7QP7j/wDfNH2gf3H/AO+aAJaKi+0D+4//AHzR9oH9x/8AvmgCWiov
tA/uP/3zR9oH9x/++aAJaKi+0D+4/wD3zR9oH9x/++aAJaKi+0D+4/8A3zR9oH9x/wDvmgCW
iovtA/uP/wB80faB/cf/AL5oAloqL7QP7j/980faB/cf/vmgCWiovtA/uP8A980faB/cf/vm
gD+eSuq8Ff6+H/r6X+lcrXVeCv8AXw/9fS/0oA/eUfxf57CnL94fWmj+L/PYU5fvD60AT2P/
AB7j6mp8VWtH2W2fTJr5E8T/ALbviDQvEepaZF4e02ZLS4kgD+axZtrEA4yOoFehhMBiMc5R
oRvbc8vHZlhsvUXiJWufYmPr+dGPr+dfK/wo/a8134gfEHRtAu9AsbW2v3cGeGR2IURswZcn
kEqB045r6M8S+MtL8H2tvc6xdrZwXEy28LFGcvIwJChVBPIBqMVg62CmoVlZs0wWOoY+DnQd
0jcx9fzox9fzqvbXi3cEU8QYxyKHXehUkcdiAR16EVmy+L9Oi8QXGimVhf29iuoyp5bECEs6
g57HKNx14riPQNrH1/OjH1/Osvw/4js/E+h2Gr6fL5thfRLNA7KVZlIyPlPOcdq56L4yeD7j
UbSwi1+0kurooIlTcyuzyNEg3AYGZEZBnGSpAoA7XH1/OjH1/OsjXvFOneF7SK51a9gsYZZU
gQyN9+R2wiD3PQfj6VrjNABj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6
/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/n
S0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0
UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UA
Jj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj6/nRj6/nS0UAJj
6/nRj6/nS0UAfzv11Xgr/Xw/9fS/0rla6rwV/r4f+vpf6UAfvKP4v89hSjgikH8X+ewpy/eH
1oAfbNttScZ61+bd7rmiaR8QvFMXiPQv7d0+5unyFdo5omWQsMMOMEnB46dxX6T2a7rcfU1R
k8JaJK7O+kWLuxyWa2Qkn8RXtZZj6eBc3Ug5XXR2Pns1y2pmKgqc1Gz6q58E/BTxVe+L/wBo
7wxqF5FHbqrPDBbQJsjt4hBJtjAA6Zx1yc19l/Fn4azfEzRtKtINSTTZtO1GPUkd4ZZEkZEd
AjeXLE4BDnkP1A9MV1tr4W0eynSeDTLOGZPuyRwIrDr0IHua0TEpIJySDnmssyxkMdVjOnFx
SXe5plWXzy+lKFSSk32VjxDW/wBm/wDtnWNZ1n+3bW31fVEmWW7XTAVKvbRQhCGlJZFMZbDE
k+Zgn1wtO/ZE+wXWhu3iK3f+y1jjSVNJCzxol5JdKttIZiYFJkEbLyCgI6nI+jtgyT60gjAO
cnPc+teUe6eH/D39m7/hAPHWl+ITrw1BrLTY9MWIWTxyCOOIRoqyCbCx4UMYyrAvkjb0qfwd
+zTomh6099qlwNfUQLHDbSRtDChW6up1d1D7X5uSBuBKlMj29p8scdePegxA5zkg84oA8In/
AGUtLu9CFrc65fSahHepcW99GCgihj8lY4THkqdsUATfxyzHHOK91QEYzkkYBOOD0pwjA6fW
nbRnPegBaKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA
KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP53
66rwV/r4f+vpf6VytdV4K/18P/X0v9KAP3lH8X+ewpy/eH1po/i/z2FOX7w+tAE9kcW+fc1B
HqgkjVlhkIYAgheDxU1n/wAe34mo9MwLC3AJICj+VACjUl3hWiljy20Fk4qwzsOQOh5AGcj+
lU74gSWjE4xL3PsTXnHx+8OeI/Enh7QIfD1pLezW+sw3N3BEwXfb+XKHBBuIA3zMvAkGf1oA
9UDMQPf2PFNE3zhCV3YyRnnt2/P8q8N1E/Fi01DU59KtrmXSxFJFY6YDZIVUWsPlkOxciTzv
NXLO6/LyOa5Cy8O/GW58TaXq95YTrqU9hDp9/K7WBgeIX8xf7QF5Li2dCPJC5bGemKAPqCO4
EiqyncrAbSOh4znPpTllyNxUouM/MP514D8G9L+Kfh/W/D2ka1p/2PwlZaTDDJEGtpQJliw2
8qd5k85chlZk2EAqD81Yvgv4NePL/wAU291rer3uh29jDDJDKJ/tE0kq315KUQiQooMTQBt6
SZUqBggmgD6X80jOVI9Af/rZpTIR24Bwf8/57185+JfDHxn8VeGYWkuoba6tdRgcadHOkD3C
RPErSmSPI2vmWUoWzjYuMg52vEfhDxjdfGttU0+xv47NpdOaDVPtyfZYIIxJ9qhMJk3szqwG
fLAzjkUAe5+Zg4OCc449cZoLnK4xjPP/ANb9K+WvD/w4+LVn4Z0O21tptQit9I0qC8sLO4EM
syxXDm5tTIbhg0uwg+dlFf7oI611Phn4W+IdV+Kseuv/AGl4W8PWEFk9pYXNwZ7hiplMkO5L
hkVGyu8MjEjoVoA9/ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
D+d+uq8Ff6+H/r6X+lcrXVeCv9fD/wBfS/0oA/eUfxf57CnL94fWmj+L/PYU5fvD60AT2P8A
x7j6miG0EEaokj7VGBnH+FFj/wAe4+pqbd9KAIWs1d0ZndijbhkjrjHpUnkqGyCQeTwcD8ul
Pyew/Ckz6YoAQwoWzgZ6dO3p9Kb9nUlSSWKjv/P2/D1pTIMkD7w7envSh2PYDJ4BoATyVDA+
nTgdPT9AaXyl+br83B96fRQBH5I2kZODn0/z707ywRg8j0xTqKAIxAvPXJ7g4Pb0+lL5Qzn3
z0HX1p9FABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH879dV4
K/18P/X0v9K5Wuq8Ff6+H/r6X+lAH7yj+L/PYU5fvD600fxf57CnL94fWgCay4tvxPSvnTTf
jR8RfFHjKLR9A07T7xYpb3zP3YVPLh1F7YF3a4G0eUgbKLIdx+6o4r6Ls/8Aj1OeRzVCK8sU
xJGkgLH78du565JIwvc5JPfvQB4b42/aY1q18F6rqeheFrj7Xpc32a9lkjluobWZN5mjYRKC
2AqANlRmVewNdD47+O83g74laPphtJJfDohj/te4+xys9vLOsn2ZN/CoWZACH5O9cV6objT2
R42hkaJ/vRtauVPOeRtxTnu7CUsXhkcsQWLWjnODkZ+Xsen0oA+Z7v8Aak1ZvDXivUIY7OKa
aN/7IJvovIsQNP8AtJMkvlcy7jtERU5YYzXU3P7T8nh/Trae98OzXMcl/wD2ULlJjummSISS
OUSI7dwICgkZPXaOR7OY9IMJi+xfuy/mFRZMAX/vfc6+9PZ9NdCj27spO4g2j9fX7tAHjv8A
w1ZYi4ELaRCrnVF08r/aClkVi2JCAh3ZwuNm5csAXWvd1fdjBB+lZCx6Qq7RZfLu3Y+xN19f
uewq2NVtx1+0E+v2eT/4mgC/RVL+17f0n/8AAeT/AOJo/te39J//AAHk/wDiaALtFUv7Xt/S
f/wHk/8AiaP7Xt/Sf/wHk/8AiaALtFUv7Xt/Sf8A8B5P/iaP7Xt/Sf8A8B5P/iaALtFUv7Xt
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
99f++qf5af3V/Kjy0/ur+VAH/9k=
--------------7AB4D1F0CDF90CAC96C24668--

--------------A34F6EE692F8E972C50AB58C--

