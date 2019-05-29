Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BC72DE00
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 15:22:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DWb216kXzDqRd
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 23:22:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DWT20sZVzDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 23:16:53 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TDGcPj106215
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 09:16:49 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sssn0u9ut-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 09:16:43 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 29 May 2019 14:14:31 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 14:14:28 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TDERGQ26149250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 13:14:27 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F9A6E059;
 Wed, 29 May 2019 13:14:27 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F32F06E04C;
 Wed, 29 May 2019 13:14:26 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 May 2019 13:14:26 +0000 (GMT)
Subject: Re: IKVM on AST2400
To: Wim Vervoorn <wvervoorn@eltan.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <d826c4212f9b472ab33bf1036e5a4768@Eltsrv03.Eltan.local>
 <78912a29-889f-0252-52e2-7861930be5ef@linux.vnet.ibm.com>
 <76a1327991c541f9a328292c672d99e4@Eltsrv03.Eltan.local>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 29 May 2019 08:14:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <76a1327991c541f9a328292c672d99e4@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052913-0020-0000-0000-00000EF19D39
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011179; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210274; UDB=6.00635848; IPR=6.00991306; 
 MB=3.00027101; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 13:14:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052913-0021-0000-0000-0000660334FA
Message-Id: <afcb5928-b1f5-e9c9-e0ba-2c3f2459ae8c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290088
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


On 5/29/19 7:09 AM, Wim Vervoorn wrote:
> Hello Eddie,
>
> Thanks for your response.
>
> It clears things up a bit.
>
> Just to make sure I understand the mechanism correctly.
>
> The " gfx_memory" is used to buffer the actual framebuffer content is that right?
>
> The "video_engine_memory" are is the compression buffer.


No, the gfx_memory is for the DRM driver on the bmc, that handles the 
buffers for actually displaying the VGA output locally, i.e. you plug a 
monitor into the back of the system. The video_engine_memory is for the 
framebuffer and compression buffer for the video engine driver, which 
grabs the VGA output into RGB data. Sorry for the confusion...


>
> The driver allocates the memory from these reserved areas. Is there a way to release these area's for general use when the iKVM is shutdown. This would allow me to update the system right now these two area's are already occupying a large part of the system memory and I need approx. 32 MB to perform the update.


Not that I'm aware of. If the reserved memory is set in the devicetree, 
I think it's fixed. There might be a way to instead call 
dma_declare_coherent or something at probe time that would reliably get 
enough memory, that could then be allocated later. And removing the 
driver module would release it in that case. I haven't tried that.


Thanks,

Eddie


>
> Best Regards,
> Wim Vervoorn
>
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+wvervoorn=eltan.com@lists.ozlabs.org] On Behalf Of Eddie James
> Sent: Tuesday, May 28, 2019 5:33 PM
> To: Alexander A. Filippov <a.filippov@yadro.com>; openbmc@lists.ozlabs.org
> Subject: Re: IKVM on AST2400
>
>
> On 5/27/19 7:40 AM, Alexander A. Filippov wrote:
>> On Mon, May 27, 2019 at 08:19:44AM +0000, Wim Vervoorn wrote:
>>> Hello Alexander,
>>>
>>> We are supporting the AST2400 as well.
>>>
>>> I am also wondering what the correct changes are to get iKVM working properly on the AST2400.
>>>
>>> The errors caused by create_usbhid.sh are caused by usb gadget support that isn't enabled. This should be done in the Linux kernel. We are using the following options:
>>>
>>> CONFIG_USB_GADGET=y
>>> CONFIG_USB_F_HID=y
>>> CONFIG_USB_GADGET=y
>>> CONFIG_USB_ASPEED_VHUB=y
>>> CONFIG_USB_CONFIGFS=y
>>> CONFIG_USB_CONFIGFS_MASS_STORAGE=y
>>> CONFIG_USB_CONFIGFS_F_HID=y
>>>
>>> The CONFIG_USB_CONFIGFS_MASS_STORAGE is not really needed for this. This is only required if you also want to support emulation of a USB storage device.
>>>
>>> Besides this you need a small change to the aspeed-g4.dtsi and the system dts to add the VHUB device. You can copy that from the aspeed-g5.dtsi.
>> Yes, I've done it too.
>>
>>> I am wondering which support you enabled for the actual iKVM support to work and which code you are actually using. (which kernel etc).
>> We use linux-aspeed recipe from OpenBMC mainline.
>> So, our kernel is 5.1.3.
>>
>> I've also enabled these options:
>>       CONFIG_DRM=y
>>       CONFIG_DRM_ASPEED_GFX=y
>>       CONFIG_FRAME_VECTOR=y
>>       CONFIG_MEDIA_SUPPORT=y
>>       CONFIG_MEDIA_CAMERA_SUPPORT=y
>>       CONFIG_VIDEO_DEV=y
>>       CONFIG_VIDEO_V4L2=y
>>       CONFIG_V4L_PLATFORM_DRIVERS=y
>>       CONFIG_VIDEO_ASPEED=y
>>       CONFIG_VIDEOBUF2_CORE=y
>>       CONFIG_VIDEOBUF2_V4L2=y
>>       CONFIG_VIDEOBUF2_MEMOPS=y
>>       CONFIG_VIDEOBUF2_DMA_CONTIG=y
>>       CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
>>
>> and copied vga_scratch and video nodes from aspeed-g5.dtsi.
>> I've sent these changes to correspond maillists.
>>     https://lore.kernel.org/patchwork/patch/1079462/
>>
>>> As far as I have understood these memory area's are required but I am not really sure about it.
>>>
>>> 		gfx_memory: framebuffer {
>>> 			size = <0x00800000>;
>>> 			alignment = <0x01000000>;
>>> 			compatible = "shared-dma-pool";
>>> 			reusable;
>>> 		};
>>>
>>> 		video_engine_memory: jpegbuffer {
>>> 			size = <0x02000000>;	/* 32MM */
>>> 			alignment = <0x01000000>;
>>> 			compatible = "shared-dma-pool";
>>> 			reusable;
>>> 		};
>>>
>>> The questions I have are :
>>>
>>> The "gfx_memory" area seems double to me we also have the "vga_memory" area which also is the video memory, why do we need to define a 2nd one that as far as I understand it points to the same physical part of RAM.
>>>
>> If I understand right, this node is not required for AST2400 because
>> GFX is unsupported by SoC.
>>
>>> I can understand where the "video_engine_memory" is for but it is not clear how I can determine the required size. As the total amount of memory is limited we are trying to reduce memory usage where possible and so far I haven't been able to find out what is defining the size of this block of memory.
>> I can't say anything about choosing buffer's size. I just copied it
>> from AST2500 and it works for me.
> Hi Wim,
>
> In order to detect the resolution, the driver allocates a buffer for the largest possible resolution (1920x1200x32bpp). Once detected, the memory is reduced down to what is needed (double buffer of the detected resolution, as well as the compression buffer, which is small in comparison). So that is why that reserved memory block is that size, though I think it is larger than it needs to be. I had issues with attempting to reliably allocate DMA without the reserved memory (memory is probably too fragmented).
>
> Hope that helps,
>
> Eddie
>
>>> Best regards,
>>>
>>> Wim Vervoorn
>>>
>>>
>>>
>>>
>>>
>>>
>>> Date: Fri, 24 May 2019 15:03:28 +0300
>>> From: "Alexander A. Filippov" <a.filippov@yadro.com>
>>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>> Subject: IKVM on AST2400
>>> Message-ID: <20190524120328.GA648@bbwork.lan>
>>> Content-Type: text/plain; charset="utf-8"
>>>
>>> Some time ago the obmc-ikvm service was added to the firmware. It causes some problems on our VESNIN hardware. As it based on AST2400 it does not have support for IKVM in the DTS. The system log contains messages that create_usbhid.sh is unable to find some items in the sysfs and then obmc-ikvm service crashes. It causes fail in QEMU_CI test.
>>>
>>> I belive that this issue also present on other platforms based on AST2400.
>>>
>>> IBM Guys: Do you run tests for Palmetto?
>>> Is there anybody else who uses AST2400?
>>>
>>> Well, my proposal is to make the IKVM support optional by moving it to the distrofeature.
>>>
>>> Besides, I've solved these problems for our hardware by adding required kernel modules and modifying DTS.
>>> IKVM works, but bring a lot of warnings after the host was shut down while the VNC-client is still connected.
>>>
>>> During the solving I copied some records from aspeed-g5.dtsi to aspeed-g4.dtsi.
>>> Should I commit these changes to Torvalds or OpenBMC repo?
>>>
>>> --
>>> Regards
>>> Alexander Filippov
>>> Software Engineer, YADRO
>>>
>>>
>>>
>
>

