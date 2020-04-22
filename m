Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDE1B36D7
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 07:35:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Tfs6N1xzDqyl
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 15:35:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Tdy5vyGzDqtQ
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 15:34:40 +1000 (AEST)
IronPort-SDR: bp2bvF1Zdo5Q4r51/JMryhpZ4xSKWLFk4JEj/GjW6QLdEgKJTKqHXY0CHH8h6//BMfEEmvyvaU
 hsKTMm7PVkCw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 22:34:38 -0700
IronPort-SDR: eDGDMkTobxYGHfCQu5in2KiTEz1TS/axllHg32htW2nqq8ACtEl/kgNxkadFuiXYtViAMADCGV
 KDcxL201J3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,412,1580803200"; 
 d="scan'208,217";a="456373236"
Received: from yongli3-mobl1.ccr.corp.intel.com (HELO [10.238.5.105])
 ([10.238.5.105])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2020 22:34:35 -0700
Subject: =?UTF-8?B?UmU6IGFib3V0IHBvd2VyIGNvbnRyb2wu5Zue5aSNOiBDYWxsIGZvciBH?=
 =?UTF-8?Q?ardening_Tasks?=
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>,
 Sui Chen <suichen6@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
 <PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com>
From: "Li, Yong" <yong.b.li@linux.intel.com>
Message-ID: <12c67029-2a01-13c6-de2e-9721d85c4ec7@linux.intel.com>
Date: Wed, 22 Apr 2020 13:34:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------E565549C4BF89AD3993BC1AF"
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
Cc: "uperic@163.com" <uperic@163.com>,
 "shinerocky@yahoo.com" <shinerocky@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E565549C4BF89AD3993BC1AF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Regarding the power control related, sugest to check on the below:

https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp



It uses litter systems related services/targets, and monitor these gpio 
signals, to trigger different callback actions.


For the pgood_wait, it is in:

https://github.com/openbmc/skeleton/tree/master/op-pwrctl/pgood_wait

https://github.com/openbmc/skeleton/tree/master/op-pwrctl


Thanks,

Yong


在 4/21/2020 10:50 PM, zhouyuanqing8@outlook.com 写道:
> Hi
>
>     This is a very good idea. As the first time to do openbmc, I look 
> forward to it. Currently, I am being troubled by the problems you 
> describe.
>
>     The following questions, please also help you answer it, thank you 
> very much.
>
>     1.I modified the dts file, how to use the command "bitbake -f 
> linux-aspeed" to Generate fitimage and dub？
>      Now, I modify the dts file in the kernel source directory. When I 
> compile, bitbake will re-fetch the source code, decompress, patch, 
> configure, and compile, causing my changes to be overwritten. I 
> currently use manual call scripts to compile dts files and make images 
> for debugging.Is there a way to make bitbake skip the previous steps 
> and compile directly？
>
>
>      2.The size of image-rwfs is 0, I want to use rwfs debugging, how 
> to configure to generate a normal image-rwfs?
> -rw-r--r--. 2 harleyzhou harleyzhou     9443     4月        7 17:27 
> obmc-phosphor-image-xxh-20200407092558.rootfs.manifest
>      -rw-r--r--. 2 harleyzhou harleyzhou 18214912 4月    7 17:27 
> obmc-phosphor-image-xxh-20200407092558.rootfs.squashfs-xz
>      -rw-rw-r--. 2 harleyzhou harleyzhou 33554432        4月   7 17:27 
> obmc-phosphor-image-xxh-20200407092558.static.mtd
>      -rw-rw-r--. 2 harleyzhou harleyzhou 33566720        4月   7 17:28 
> obmc-phosphor-image-xxh-20200407092558.static.mtd.all.tar
>      -rw-rw-r--. 2 harleyzhou harleyzhou 22384640        4月   7 17:28 
> obmc-phosphor-image-xxh-20200407092558.static.mtd.tar
>      -rw-r--r--. 2 harleyzhou harleyzhou   308218  4月      7 17:27 
> obmc-phosphor-image-xxh-20200407092558.testdata.json
>      -rw-r--r--. 2 harleyzhou harleyzhou           0  4月   7 17:27 
> obmc-phosphor-image-xxh.jffs2
>
>
>     3. I did not find the source code of "pgood_wait" and 
> "power_control.exe" in obmc-op-control-power? where can I get it ?
>
>
>     4.OpenBMC usessystemd 
> <https://www.freedesktop.org/wiki/Software/systemd/>to manage all 
> processes, So i analyzed the process of systemd starting process and 
> saw "default.target-> basic.target-> sysinit.target-> 
> local-fs.target", there is no content behind.please help to provide 
> clues of systemd starting process.
>
>     5.I understand the following execution process of power-on , help 
> check if it is correct.
>        a).rest or busctl send power-on commands to systemd through 
> d-bus messages.
>        b).systemd find the obmc-chassis-poweron@.target
>   c).systemd find the obmc-power-start@.target
> d).systemd find the op-power-start@0.service
> e).systemd start a thread and execute "busctl call `mapper get-service 
> /org/openbmc/control/power%i` /org/openbmc/control/power%i 
> org.openbmc.control.Power setPowerState I 1"
>
> appendix：
>
> ls obmc-chassis-poweron@0.target.requires
>
> op-power-start@0.serviceop-wait-power-on@0.service
>
>
> cat obmc-chassis-poweron@.target
>
> [Unit]
>
> Description=Chassis%i (Power On)
>
> Wants=multi-user.target
>
> After=multi-user.target
>
> Wants=mapper-wait@-xyz-openbmc_project-state-chassis%i.service
>
> After=mapper-wait@-xyz-openbmc_project-state-chassis%i.service
>
> Wants=mapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service
>
> After=mapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service
>
>
> cat op-power-start@0.service
>
> [Unit]
>
> Description=Start Power%i
>
> Wants=obmc-power-start@%i.target
>
> Before=obmc-power-start@%i.target
>
> After=obmc-power-start-pre@%i.target
>
> After=obmc-fan-control.target
>
> Wants=mapper-wait@-org-openbmc-control-power%i.service
>
> After=mapper-wait@-org-openbmc-control-power%i.service
>
> [Service]
>
> RemainAfterExit=yes
>
> Type=oneshot
>
> ExecStart=/bin/sh -c "busctl call `mapper get-service 
> /org/openbmc/control/power%i` /org/openbmc/control/power%i 
> org.openbmc.control.Power setPowerState i 1"
>
> SyslogIdentifier=op-power-start
>
> [Install]
>
> WantedBy=obmc-host-start@%i.target
>
>
> cat obmc-power-start@.target
>
> [Unit]
>
> Description=Power%i On
>
> After=obmc-power-start-pre@%i.target
>
> Wants=multi-user.target
>
> Conflicts=obmc-chassis-poweroff@%i.target
>
> RefuseManualStart=yes
>
> RefuseManualStop=yes
>
>
> Thanks
> Harley
> ------------------------------------------------------------------------
> *发件人:* openbmc 
> <openbmc-bounces+zhouyuanqing8=outlook.com@lists.ozlabs.org> 代表 Sui 
> Chen <suichen6@gmail.com>
> *发送时间:* 2020年4月21日 1:05
> *收件人:* openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> *主题:* Re: Call for Gardening Tasks
>
> > On Apr 11, 2020, at 8:15 AM, Andrew Geissler <geissonator at gmail.com> wrote:
>
> > Systemd Visualization
>
> > Another complicated area of OpenBMC is our systemd targets and services. Building on the upstream 
> tools to visualize our systemd targets and services would be useful to 
> new people.
>
> +1 to visualization, and I have a few thoughts on this ---
>
> My lacking a mental model of how an OpenBMC system works had been my 
> pain point in the first few months working with OpenBMC (I’m a bit new 
> to this area), so after learning the minimal set of survival skills I 
> did something similar to what you mentioned – visualizing the messages 
> passed between different dbus peers (and conveniently, IPMI traffic, 
> as IPMI-related dbus messages exposing all IPMI payload comprise most 
> of the dbus traffic on that particular system I was working on.)
>
> I think packet analysis tools such as Wireshark and graphics frame 
> analysis tools such as RenderDoc, or system event-based Windows 
> Performance tool like GPUView provide great examples of what people 
> might expect to achieve with a visualization tool: capture, inspect 
> and (sometimes) playback, across multiple layers in the 
> software/hardware stack. Many similar existing tools process sequences 
> of events, and in this case of BMCs, the events could be dbus 
> messages. I found a prototype visualizer made at work greatly helpful 
> in explaining to new team members some basic concepts and the IPMI 
> stack on the BMC.
>
> The IPMI stack is interesting because it’s one noticeable workload on 
> the particular BMC system I had been working on; in my current limited 
> understanding, having lots of I/O capability to connect to hundreds of 
> sensors is one of the many features that set apart a BMC chip and a 
> similarly powerful smartphone chip, and the broad use of dbus is what 
> sets apart OpenBMC and the desktop Linux distro I had been using. I 
> heard optimization is best done workload by workload, perhaps this 
> rationale applies to visualization too?
>
> I realize I was mostly talking about visualizing the run-time state of 
> the system rather than build-time, but we could visualize the run-time 
> aspect of systemd units too since I have seen many times a dbus 
> message eventually triggering a systemd target to acutate the system, 
> so it would be good to consider both dbus and systemd (and maybe other 
> parts of the system?) to have a more holistic view of the BMC’s 
> operations.
>
> Thanks
>
> Sui
>

--------------E565549C4BF89AD3993BC1AF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Regarding the power control related, sugest to check on the
      below:</p>
    <p><a
href="https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp">https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp</a></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>It uses litter systems related services/targets, and monitor
      these gpio signals, to trigger different callback actions.<br>
    </p>
    <p><br>
    </p>
    <p>For the pgood_wait, it is in:</p>
    <p> <a
href="https://github.com/openbmc/skeleton/tree/master/op-pwrctl/pgood_wait">https://github.com/openbmc/skeleton/tree/master/op-pwrctl/pgood_wait</a></p>
    <p><a
        href="https://github.com/openbmc/skeleton/tree/master/op-pwrctl">https://github.com/openbmc/skeleton/tree/master/op-pwrctl</a></p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Yong<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 4/21/2020 10:50 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:zhouyuanqing8@outlook.com">zhouyuanqing8@outlook.com</a> 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hi </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
            This is a very good idea. As the first time to do openbmc, I
        look forward to it. Currently, I am being troubled by the
        problems you describe.<br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
            The following questions, please also help you answer it,
        thank you very much.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
            1.I modified the dts file, how to use the command "bitbake
        -f linux-aspeed" to Generate fitimage and dub？</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
             Now, I modify the dts file in the kernel source directory.
        When I compile, bitbake will re-fetch the source code,
        decompress, patch, configure, and compile, causing my changes to
        be overwritten. I currently use manual call scripts to compile
        dts files and make images for debugging.Is there a way to make
        bitbake skip the previous steps and compile directly？</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
             2.The size of image-rwfs is 0, I want to use rwfs
        debugging, how to configure to generate a normal image-rwfs? </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
             <span>-rw-r--r--. 2 harleyzhou harleyzhou     9443        
              4月        7 17:27
          obmc-phosphor-image-xxh-20200407092558.rootfs.manifest<br>
        </span>
        <div>     -rw-r--r--. 2 harleyzhou harleyzhou 18214912        
          4月    7 17:27 obmc-phosphor-image-<span style="caret-color:
            rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
            sans-serif; background-color: rgb(255, 255, 255); display:
            inline !important">xxh</span>-20200407092558.rootfs.squashfs-xz<br>
        </div>
        <div>     -rw-rw-r--. 2 harleyzhou harleyzhou 33554432        4月
            7 17:27 obmc-phosphor-image-<span style="caret-color: rgb(0,
            0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;
            background-color: rgb(255, 255, 255); display: inline
            !important">xxh</span>-20200407092558.static.mtd<br>
        </div>
        <div>     -rw-rw-r--. 2 harleyzhou harleyzhou 33566720        4月
            7 17:28 obmc-phosphor-image-<span style="caret-color: rgb(0,
            0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;
            background-color: rgb(255, 255, 255); display: inline
            !important">xxh</span>-20200407092558.static.mtd.all.tar<br>
        </div>
        <div>     -rw-rw-r--. 2 harleyzhou harleyzhou 22384640        4月
            7 17:28 obmc-phosphor-image-<span style="caret-color: rgb(0,
            0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;
            background-color: rgb(255, 255, 255); display: inline
            !important">xxh</span>-20200407092558.static.mtd.tar<br>
        </div>
        <div>     -rw-r--r--. 2 harleyzhou harleyzhou   308218          
           4月      7 17:27 obmc-phosphor-image-<span style="caret-color:
            rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
            sans-serif; background-color: rgb(255, 255, 255); display:
            inline !important">xxh</span>-20200407092558.testdata.json<br>
        </div>
        <div>     -rw-r--r--. 2 harleyzhou harleyzhou           0      
                 <span style="background-color: rgb(0, 255, 0);"> 4月   7
            17:27 obmc-phosphor-image-</span><span style="caret-color:
            rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
            sans-serif; background-color: rgb(0, 255, 0); display:
            inline !important;">xxh</span><span style="background-color:
            rgb(0, 255, 0);">.jffs2</span><br>
        </div>
        <span></span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
            3. I did not find the source code of "pgood_wait" and
        "power_control.exe" in obmc-op-control-power? where can I get it
        ?</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
            4.<span style="caret-color: rgb(36, 41, 46); color: rgb(36,
          41, 46); font-family: -apple-system, BlinkMacSystemFont,
          &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif,
          &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;;
          background-color: rgb(255, 255, 255); display: inline
          !important">OpenBMC uses<span> </span></span><a
          href="https://www.freedesktop.org/wiki/Software/systemd/"
          rel="nofollow" style="box-sizing: border-box; color: rgb(3,
          102, 214); font-family: -apple-system, BlinkMacSystemFont,
          &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif,
          &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;"
          moz-do-not-send="true">systemd</a><span style="caret-color:
          rgb(36, 41, 46); color: rgb(36, 41, 46); font-family:
          -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;,
          Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;,
          &quot;Segoe UI Emoji&quot;; background-color: rgb(255, 255,
          255); display: inline !important"><span> </span>to manage all
          processes, So i analyzed the process of systemd starting
          process and saw "default.target-&gt; basic.target-&gt;
          sysinit.target-&gt; local-fs.target", there is no content
          behind.please help to provide clues of systemd starting
          process.</span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="caret-color: rgb(36, 41, 46); color: rgb(36, 41,
          46); font-family: -apple-system, BlinkMacSystemFont,
          &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif,
          &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;;
          background-color: rgb(255, 255, 255); display: inline
          !important"><br>
        </span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="caret-color: rgb(36, 41, 46); color: rgb(36, 41,
          46); font-family: -apple-system, BlinkMacSystemFont,
          &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif,
          &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;;
          background-color: rgb(255, 255, 255); display: inline
          !important">    5.I understand the following execution process
          of power-on , help check if it is correct.</span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
               a).rest or busctl send power-on commands to systemd
        through d-bus messages.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
               b).systemd find the <span style="caret-color: rgb(36,
          41, 46); color: rgb(36, 41, 46); font-family: &quot;PingFang
          SC&quot;; font-size: 12px; background-color: rgb(255, 255,
          255); display: inline !important">
          <a class="moz-txt-link-abbreviated" href="mailto:obmc-chassis-poweron@.target">obmc-chassis-poweron@.target</a></span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="caret-color: rgb(36, 41, 46); color: rgb(36, 41,
          46); font-family: &quot;PingFang SC&quot;; font-size: 12px;
          background-color: rgb(255, 255, 255); display: inline
          !important">     
          <span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);
            font-family: Calibri, Arial, Helvetica, sans-serif;
            font-size: 16px; background-color: rgb(255, 255, 255);
            display: inline !important">
              c).systemd find the <span style="caret-color: rgb(36, 41,
              46); color: rgb(36, 41, 46); font-family: &quot;PingFang
              SC&quot;; font-size: 12px; background-color: rgb(255, 255,
              255); display: inline !important"><a class="moz-txt-link-abbreviated" href="mailto:obmc-power-start@.target">obmc-power-start@.target</a></span></span></span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="caret-color: rgb(36, 41, 46); color: rgb(36, 41,
          46); font-family: &quot;PingFang SC&quot;; font-size: 12px;
          background-color: rgb(255, 255, 255); display: inline
          !important"><span style="caret-color: rgb(0, 0, 0); color:
            rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 16px; background-color: rgb(255, 255,
            255); display: inline !important"><span style="caret-color:
              rgb(36, 41, 46); color: rgb(36, 41, 46); font-family:
              &quot;PingFang SC&quot;; font-size: 12px;
              background-color: rgb(255, 255, 255); display: inline
              !important">        <span style="caret-color: rgb(0, 0,
                0); color: rgb(0, 0, 0); font-family: Calibri, Arial,
                Helvetica, sans-serif; font-size: 16px;
                background-color: rgb(255, 255, 255); display: inline
                !important">
                d</span><span style="caret-color: rgb(0, 0, 0); color:
                rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 16px; background-color: rgb(255,
                255, 255); display: inline !important">).systemd find
                the <span style="caret-color: rgb(36, 41, 46); color:
                  rgb(36, 41, 46); font-family: &quot;PingFang SC&quot;;
                  font-size: 12px; background-color: rgb(255, 255, 255);
                  display: inline !important"><a class="moz-txt-link-abbreviated" href="mailto:op-power-start@0.service">op-power-start@0.service</a></span><span
                  style="margin: 0px; font-family: &quot;PingFang
                  SC&quot;; font-size: 12px; color: rgb(36, 41, 46);
                  caret-color: rgb(36, 41, 46)"> </span></span></span></span></span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="caret-color: rgb(36, 41, 46); color: rgb(36, 41,
          46); font-family: &quot;PingFang SC&quot;; font-size: 12px;
          background-color: rgb(255, 255, 255); display: inline
          !important"><span style="caret-color: rgb(0, 0, 0); color:
            rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 16px; background-color: rgb(255, 255,
            255); display: inline !important"><span style="caret-color:
              rgb(36, 41, 46); color: rgb(36, 41, 46); font-family:
              &quot;PingFang SC&quot;; font-size: 12px;
              background-color: rgb(255, 255, 255); display: inline
              !important"><span style="caret-color: rgb(0, 0, 0); color:
                rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 16px; background-color: rgb(255,
                255, 255); display: inline !important"><span
                  style="margin: 0px; font-family: &quot;PingFang
                  SC&quot;; font-size: 12px; color: rgb(36, 41, 46);
                  caret-color: rgb(36, 41, 46)">        <span
                    style="margin: 0px; font-family: Calibri, Arial,
                    Helvetica, sans-serif; font-size: 16px; color:
                    rgb(0, 0, 0); background-color: rgb(255, 255, 255);
                    caret-color: rgb(0, 0, 0); display: inline
                    !important">e</span><span style="margin: 0px;
                    font-family: Calibri, Arial, Helvetica, sans-serif;
                    font-size: 16px; color: rgb(0, 0, 0);
                    background-color: rgb(255, 255, 255); caret-color:
                    rgb(0, 0, 0); display: inline !important">).<span
                      style="caret-color: rgb(0, 0, 0); font-family:
                      Calibri, Arial, Helvetica, sans-serif;
                      background-color: rgb(255, 255, 255); display:
                      inline !important">systemd start a thread and
                      execute "<span style="caret-color: rgb(36, 41,
                        46); color: rgb(36, 41, 46); font-family:
                        &quot;PingFang SC&quot;; font-size: 12px;
                        background-color: rgb(255, 255, 255); display:
                        inline !important">busctl call `mapper
                        get-service /org/openbmc/control/power%i`
                        /org/openbmc/control/power%i
                        org.openbmc.control.Power setPowerState I 1"</span></span></span></span></span></span></span></span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        appendix：<br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="caret-color: rgb(36, 41, 46); color: rgb(36, 41,
          46); font-family: -apple-system, BlinkMacSystemFont,
          &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif,
          &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;;
          background-color: rgb(255, 255, 255); display: inline
          !important">
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">ls <a class="moz-txt-link-abbreviated" href="mailto:obmc-chassis-poweron@0.target.requires">obmc-chassis-poweron@0.target.requires</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:op-power-start@0.service">op-power-start@0.service</a><span> 
            </span><a class="moz-txt-link-abbreviated" href="mailto:op-wait-power-on@0.service">op-wait-power-on@0.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'; min-height: 17.0px">
            <br>
          </p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">cat <a class="moz-txt-link-abbreviated" href="mailto:obmc-chassis-poweron@.target">obmc-chassis-poweron@.target</a><span> </span></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">[Unit]</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">Description=Chassis%i (Power On)</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">Wants=multi-user.target</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">After=multi-user.target</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:Wants=mapper-wait@-xyz-openbmc_project-state-chassis%i.service">Wants=mapper-wait@-xyz-openbmc_project-state-chassis%i.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:After=mapper-wait@-xyz-openbmc_project-state-chassis%i.service">After=mapper-wait@-xyz-openbmc_project-state-chassis%i.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:Wants=mapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service">Wants=mapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:After=mapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service">After=mapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'; min-height: 17.0px">
            <br>
          </p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">cat <a class="moz-txt-link-abbreviated" href="mailto:op-power-start@0.service">op-power-start@0.service</a><span> </span></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">[Unit]</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">Description=Start Power%i</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:Wants=obmc-power-start@%i.target">Wants=obmc-power-start@%i.target</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:Before=obmc-power-start@%i.target">Before=obmc-power-start@%i.target</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:After=obmc-power-start-pre@%i.target">After=obmc-power-start-pre@%i.target</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">After=obmc-fan-control.target</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:Wants=mapper-wait@-org-openbmc-control-power%i.service">Wants=mapper-wait@-org-openbmc-control-power%i.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:After=mapper-wait@-org-openbmc-control-power%i.service">After=mapper-wait@-org-openbmc-control-power%i.service</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">[Service]</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">RemainAfterExit=yes</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">Type=oneshot</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">ExecStart=/bin/sh -c "busctl call `mapper
            get-service /org/openbmc/control/power%i`
            /org/openbmc/control/power%i org.openbmc.control.Power
            setPowerState i 1"</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">SyslogIdentifier=op-power-start</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">[Install]</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:WantedBy=obmc-host-start@%i.target">WantedBy=obmc-host-start@%i.target</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'; min-height: 17.0px">
            <br>
          </p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">cat <a class="moz-txt-link-abbreviated" href="mailto:obmc-power-start@.target">obmc-power-start@.target</a><span> </span></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">[Unit]</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">Description=Power%i On</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:After=obmc-power-start-pre@%i.target">After=obmc-power-start-pre@%i.target</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">Wants=multi-user.target</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'"><a class="moz-txt-link-abbreviated" href="mailto:Conflicts=obmc-chassis-poweroff@%i.target">Conflicts=obmc-chassis-poweroff@%i.target</a></p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">RefuseManualStart=yes</p>
          <p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px
            'PingFang SC'">RefuseManualStop=yes</p>
          <br>
        </span></div>
      <div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          <span style="caret-color: rgb(50, 49, 48); color: rgb(50, 49,
            48); font-family: DengXian; text-align: justify;
            background-color: rgb(255, 255, 255); display: inline
            !important">Thanks</span><br>
        </div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          <span style="caret-color: rgb(50, 49, 48); color: rgb(50, 49,
            48); font-family: DengXian; text-align: justify;
            background-color: rgb(255, 255, 255); display: inline
            !important">Harley</span></div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>发件人:</b>
            openbmc
            <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+zhouyuanqing8=outlook.com@lists.ozlabs.org">&lt;openbmc-bounces+zhouyuanqing8=outlook.com@lists.ozlabs.org&gt;</a>
            代表 Sui Chen <a class="moz-txt-link-rfc2396E" href="mailto:suichen6@gmail.com">&lt;suichen6@gmail.com&gt;</a><br>
            <b>发送时间:</b> 2020年4月21日 1:05<br>
            <b>收件人:</b> <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a><br>
            <b>主题:</b> Re: Call for Gardening Tasks</font>
          <div> </div>
        </div>
        <div lang="ZH-CN">
          <div class="x_WordSection1">
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span lang="EN-US">&gt; On Apr 11, 2020, at 8:15 AM,
                Andrew Geissler &lt;geissonator at gmail.com&gt; wrote:</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span lang="EN-US">&gt; Systemd Visualization</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span lang="EN-US">&gt; Another complicated area of
                OpenBMC is our systemd targets and services. Building on
                the upstream tools to visualize our systemd targets and
                services would be useful to new people.</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US"> </span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">+1 to
                visualization, and I have a few thoughts on this ---</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">My lacking a
                mental model of how an OpenBMC system works had been my
                pain point in the first few months working with OpenBMC
                (I’m a bit new to this area), so after learning the
                minimal set of survival skills I did something similar
                to what you mentioned – visualizing the messages passed
                between different dbus peers (and conveniently, IPMI
                traffic, as IPMI-related dbus messages exposing all IPMI
                payload comprise most of the dbus traffic on that
                particular system I was working on.)</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US"> </span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">I think packet
                analysis tools such as Wireshark and graphics frame
                analysis tools such as RenderDoc, or system event-based
                Windows Performance tool like GPUView provide great
                examples of what people might expect to achieve with a
                visualization tool: capture, inspect and (sometimes)
                playback, across multiple layers in the
                software/hardware stack. Many similar existing tools
                process sequences of events, and in this case of BMCs,
                the events could be dbus messages. I found a prototype
                visualizer made at work greatly helpful in explaining to
                new team members some basic concepts and the IPMI stack
                on the BMC.</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US"> </span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">The IPMI stack
                is interesting because it’s one noticeable workload on
                the particular BMC system I had been working on; in my
                current limited understanding, having lots of I/O
                capability to connect to hundreds of sensors is one of
                the many features that set apart a BMC chip and a
                similarly powerful smartphone chip, and the broad use of
                dbus is what sets apart OpenBMC and the desktop Linux
                distro I had been using. I heard optimization is best
                done workload by workload, perhaps this rationale
                applies to visualization too?</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US"> </span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">I realize I
                was mostly talking about visualizing the run-time state
                of the system rather than build-time, but we could
                visualize the run-time aspect of systemd units too since
                I have seen many times a dbus message eventually
                triggering a systemd target to acutate the system, so it
                would be good to consider both dbus and systemd (and
                maybe other parts of the system?) to have a more
                holistic view of the BMC’s operations.</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US"> </span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">Thanks</span></p>
            <p class="x_MsoNormal" style="margin: 0cm 0cm 0.0001pt;
              text-align: justify; font-size: 10.5pt; font-family:
              DengXian;">
              <span style="font-size:12.0pt" lang="EN-US">Sui</span></p>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------E565549C4BF89AD3993BC1AF--
